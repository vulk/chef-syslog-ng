syslogng Cookbook
=================

This is a [Chef] cookbook for [Syslog-ng].

Not Ready to Use for Production
=================

## Repository

https://github.com/vkhatri/chef-syslog-ng


## Recipes

- `syslogng::default`     - wraps `syslogng::package` and `syslogng::config` recipe
- `syslogng::package`     - install and manage syslog-ng packages
- `syslogng::config`      - confiure core conf files and directories
- `syslogng::client`      - configure syslog-ng client
- `syslogng::server`      - configure syslog-ng server


## Cookbook Core Attributes

 * `default['syslogng']['conf_dir']` (default: /etc/syslog-ng): syslog-ng config directory
 * `default['syslogng']['log_dir']` (default: /var/log): syslog-ng log directory
 * `default['syslogng']['include_dir']` (default: /etc/syslog-ng/conf.d): syslog-ng config include directory
 * `default['syslogng']['install_method']` (default: package): install method, currently supports only package based installation
 * `default['syslogng']['cookbook']` (default: syslogng): cookbook for template reference
 * `default['syslogng']['service_name']` (default: syslog-ng): syslog-ng service name
 * `default['syslogng']['notify_restart']` (default: false): whether to notify :restart to syslog-ng service
 * `default['syslogng']['start_crond']` (default: true): whether to start crond service after removing rsyslog package, only for RHEL family systems
 * `default['syslogng']['service_action']` (default: [:enable, :start]): syslog-ng default service action

## Cookbook Core Configuration Attributes


## Server Configuration Attributes


## Client Configuration Attributes


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Write description about changes
7. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


[Chef]: https://www.getchef.com/chef/
[Contributors]: https://github.com/vkhatri/chef-syslog-ng/graphs/contributors
[Syslog-ng]: http://www.syslog-ng.org/
