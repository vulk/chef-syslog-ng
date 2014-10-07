#
# Cookbook Name:: syslogng
# Recipe:: server
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

include_recipe "syslogng::default"

listeners = []
listeners.push "udp(ip(#{node['syslogng']['server']['udp']['ip']}) port(#{node['syslogng']['server']['udp']['port']}));" if node['syslogng']['server']['udp']['enable']
listeners.push "tcp(ip(#{node['syslogng']['server']['tcp']['ip']}) port(#{node['syslogng']['server']['tcp']['port']}));" if node['syslogng']['server']['tcp']['enable']

# Enable Remote Log on both UDP & TCP
syslogng_source "s_remote" do
  value   listeners
end


syslogng_destination "d_remote" do
  value   "file(
                \"#{node['syslogng']['server']['remote_log_dir']}/#{node['syslogng']['server']['remote_log_pattern']}\"
                perm(#{node['syslogng']['server']['remote_log_dir_perms']})
                create_dirs(#{node['syslogng']['server']['create_dirs']})
        );"
end

syslogng_log "l_remote" do
  value   "source(s_remote); destination(d_remote);"
end
