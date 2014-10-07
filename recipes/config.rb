#
# Cookbook Name:: syslogng
# Recipe:: confg
#
# Copyright 2014, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

service 'crond' do
  action :start
  only_if do node['platform_family'] == 'rhel' and node['syslogng']['start_crond'] end
end

directory node['syslogng']['include_dir']

node.default['syslogng']['installed_version'] = Mixlib::ShellOut.new("syslog-ng -V | awk '$1==\"Installer-Version:\" { print $2 }'").run_command.stdout

template File.join(node['syslogng']['conf_dir'], 'syslog-ng.conf') do
  source  "#{node['platform_family']}.syslog-ng.conf.erb"
  notify  :restart, "service[syslog-ng]", :delayed if node['syslogng']['notify_restart']
end

%w(modules.conf scl.conf).each do |conf|
  template File.join(node['syslogng']['conf_dir'], conf) do
    source  (conf + '.erb')
    notify  :restart, "service[syslog-ng]", :delayed if node['syslogng']['notify_restart']
  end
end

service 'syslog-ng' do
  supports        :start => true, :stop => true, :restart => true, :reload => true, :status => true
  service_name    node['syslogng']['service_name']
  action          node['syslogng']['service_action']
end
