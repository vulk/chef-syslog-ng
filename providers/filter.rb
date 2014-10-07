#
# Cookbook Name:: syslogng
# Provider:: filter
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

def whyrun_supported?
  true
end

action :add do
  new_resource.updated_by_last_action(filter_conf)
end

action :remove do
  new_resource.updated_by_last_action(filter_conf)
end

protected
  def filter_conf
    temp = template(::File.join(node['syslogng']['include_dir'], new_resource.config_file)) do
      source    'type.conf.erb'
      cookbook  node['syslogng']['cookbook']
      owner     'root'
      group     'root'
      mode      '0644'
      variables(
        :value => syslogng_filters,
        :type => 'filter'
      )
    end

    return temp.updated?
  end

  def filter_resources
    run_context.resource_collection.select do |resource|
      resource.is_a?(Chef::Resource::SyslogngFilter)
    end
  end

  def syslogng_filters
    filter_resources.reduce({}) do |hash, resource|
      if resource.config_file == new_resource.config_file && resource.action == :add
        hash[resource.name] ||= {}
        hash[resource.name] = resource.send('value')
      end
      hash
    end
  end
