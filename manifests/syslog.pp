class opengroupware::syslog (
  $webui_service_ensure,
  $xmlrpcd_service_ensure,
  $zidestore_service_ensure,
) {

  $webui_syslog_ensure = $webui_service_ensure ? {
    /running/ => 'present',
    default => 'absent',
  }
  $xmlrpcd_syslog_ensure = $xmlrpcd_service_ensure ? {
    /running/ => 'present',
    default => 'absent',
  }
  $zidestore_syslog_ensure = $zidestore_service_ensure ? {
    /running/ => 'present',
    default => 'absent',
  }
  newsyslog { '/var/log/opengroupware/ogo-webui.log':
    ensure  => $webui_syslog_ensure,
    owner   => '_opengroupware',
    group   => '_opengroupware',
    mode    => '640',
    keep    => '7',
    size    => '1024',
    when    => '*',
    flags   => 'Z',
    command => '/etc/rc.d/ogo_webui restart',
  }
  newsyslog { '/var/log/opengroupware/ogo-xmlrpcd.log':
    ensure  => $xmlrpcd_syslog_ensure,
    owner   => '_opengroupware',
    group   => '_opengroupware',
    mode    => '640',
    keep    => '7',
    size    => '1024',
    when    => '*',
    flags   => 'Z',
    command => '/etc/rc.d/ogo_xmlrpcd restart',
  }
  newsyslog { '/var/log/opengroupware/ogo-zidestore.log':
    ensure  => $zidestore_syslog_ensure,
    owner   => '_opengroupware',
    group   => '_opengroupware',
    mode    => '640',
    keep    => '7',
    size    => '1024',
    when    => '*',
    flags   => 'Z',
    command => '/etc/rc.d/ogo_zidestore restart',
  }
}
