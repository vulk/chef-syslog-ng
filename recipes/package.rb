#
# Cookbook Name:: syslogng
# Recipe:: package
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


install_packages = value_for_platform_family(
  "debian"  => %w(syslog-ng),
  "rhel"    => %w(syslog-ng-devel syslog-ng syslog-ng-libdbi cronie cronie-anacron crontabs sysstat)
)

# RHEL Platform Family have conflict with rsyslog package
package "rsyslog" do
  action :remove
end

service "rsyslog" do
  action [:stop, :disable]
end

install_packages.each do |pkg|
  package pkg
end
