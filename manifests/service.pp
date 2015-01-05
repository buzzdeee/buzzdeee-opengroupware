class opengroupware::service (
  $webui_service_name,
  $webui_service_ensure,
  $webui_service_enable,
  $webui_service_flags,
  $xmlrpcd_service_name,
  $xmlrpcd_service_ensure,
  $xmlrpcd_service_enable,
  $xmlrpcd_service_flags,
  $zidestore_service_name,
  $zidestore_service_ensure,
  $zidestore_service_enable,
  $zidestore_service_flags,
) {
  service { $webui_service_name:
    ensure => $webui_service_ensure,
    enable => $webui_service_enable,
    flags  => $webui_service_flags,
  }
  service { $xmlrpcd_service_name:
    ensure => $xmlrpcd_service_ensure,
    enable => $xmlrpcd_service_enable,
    flags  => $xmlrpcd_service_flags,
  }
  service { $zidestore_service_name:
    ensure => $zidestore_service_ensure,
    enable => $zidestore_service_enable,
    flags  => $zidestore_service_flags,
  }
}
