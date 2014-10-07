
default['syslogng']['conf_dir'] = '/etc/syslog-ng'
default['syslogng']['log_dir'] = '/var/log'
default['syslogng']['include_dir'] = ::File.join(node['syslogng']['conf_dir'], 'conf.d')

default['syslogng']['install_method'] = 'package'
default['syslogng']['cookbook'] = 'syslogng'
default['syslogng']['service_name'] = 'syslog-ng'
default['syslogng']['notify_restart'] = false

# Applicable for RHEL Platform Family. You may disable this attribute
# provided crond service management by separate cookbook
default['syslogng']['start_crond'] = true

default['syslogng']['service_action'] = [:enable, :start]

# /etc/syslog-ng/syslog-ng.conf ptions
default['syslogng']['modules']['autoload_compiled_modules'] = 0
default['syslogng']['modules']['module'] = %w(syslogformat basicfuncs afsocket affile afprog afuser dbparser csvparser)
default['syslogng']['options']['flush_lines'] = 0
default['syslogng']['options']['time_reopen'] = 10
default['syslogng']['options']['log_fifo_size'] = 1000
default['syslogng']['options']['long_hostnames'] = 'off'
default['syslogng']['options']['use_dns'] = 'no'
default['syslogng']['options']['use_fqdn'] = 'no'
default['syslogng']['options']['create_dirs'] = 'yes'
default['syslogng']['options']['keep_hostname'] = 'yes'
default['syslogng']['options']['so_keepalive'] = 'no'
default['syslogng']['options']['normalize_hostnames'] = 'yes'
default['syslogng']['options']['bad_hostname'] = nil
default['syslogng']['options']['owner'] = 'root'
default['syslogng']['options']['group'] = 'root'
default['syslogng']['options']['perm'] = '0640'
default['syslogng']['options']['stats_freq'] = '0640'

# ::server recipe options
default['syslogng']['server']['remote_log_dir'] = '/var/log/remote'
default['syslogng']['server']['remote_log_pattern'] = '$HOST/$YEAR/$MONTH/$DAY/$FACILITY.log'
default['syslogng']['server']['remote_log_dir_perms']   = '0644'
default['syslogng']['server']['create_dirs']   = 'yes'
default['syslogng']['server']['udp']['enable'] = true
default['syslogng']['server']['tcp']['enable'] = true
default['syslogng']['server']['tcp']['ip'] = node['ipaddress']
default['syslogng']['server']['tcp']['port'] = '514'
default['syslogng']['server']['tcp']['max_connections'] = '512'
default['syslogng']['server']['udp']['ip'] = node['ipaddress']
default['syslogng']['server']['udp']['port'] = '514'
default['syslogng']['server']['udp']['max_connections'] = '512'
default['syslogng']['server']['options'] = {}

# ::client recipe options
# Require below attribute for client setup
default['syslogng']['client']['server_ip'] = nil
default['syslogng']['client']['server_port'] = '514'
default['syslogng']['client']['server_protocol'] = 'tcp'
default['syslogng']['client']['options'] = {}
