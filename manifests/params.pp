class opengroupware::params {
  $opengroupware_defaults_defaultvalues = 'opengroupware::config::config_defaults'
  $opengroupware_defaults = 'opengroupware::config::defaults'
  $package_name = 'opengroupware'
  $package_ensure = 'installed'
  $webui_service_name = 'ogo_webui'
  $webui_service_ensure = 'running'
  $webui_service_enable = true
  $webui_service_flags = undef
  $xmlrpcd_service_name = 'ogo_xmlrpcd'
  $xmlrpcd_service_ensure = 'stopped'
  $xmlrpcd_service_enable = false
  $xmlrpcd_service_flags = undef
  $zidestore_service_name = 'ogo_zidestore'
  $zidestore_service_ensure = 'running'
  $zidestore_service_enable = true
  $zidestore_service_flags = undef
}
