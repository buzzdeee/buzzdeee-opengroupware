class opengroupware::config (
  $opengroupware_defaults_defaultvalues,
  $opengroupware_defaults,
) {
  $commons = hiera_hash("$opengroupware_defaults_defaultvalues")
  $defaults = hiera_hash("$opengroupware_defaults")

  create_resources(gsdefaults, $defaults, $commons)

  cron { 'ogoskyaptnotify':
    command => 'su - _opengroupware -c "/usr/local/bin/ogoaptnotify 2>/dev/null"',
    user    => 'root',
    minute  => '*/5',
  }

}
