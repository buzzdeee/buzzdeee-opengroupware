# == Class: opengroupware
#
# Full description of class opengroupware here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'opengroupware':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class opengroupware (
  $opengroupware_defaults_defaultvalues = $opengroupware::params::opengroupware_defaults_defaultvalues,
  $opengroupware_defaults = $opengroupware::params::opengroupware_defaults,
  $package_name = $opengroupware::params::package_name,
  $package_ensure = $opengroupware::params::package_ensure,
  $webui_service_name = $opengroupware::params::webui_service_name,
  $webui_service_ensure = $opengroupware::params::webui_service_ensure,
  $webui_service_enable = $opengroupware::params::webui_service_enable,
  $webui_service_flags = $opengroupware::params::webui_service_flags,
  $xmlrpcd_service_name = $opengroupware::params::xmlrpcd_service_name,
  $xmlrpcd_service_ensure = $opengroupware::params::xmlrpcd_service_ensure,
  $xmlrpcd_service_enable = $opengroupware::params::xmlrpcd_service_enable,
  $xmlrpcd_service_flags = $opengroupware::params::xmlrpcd_service_flags,
  $zidestore_service_name = $opengroupware::params::zidestore_service_name,
  $zidestore_service_ensure = $opengroupware::params::zidestore_service_ensure,
  $zidestore_service_enable = $opengroupware::params::zidestore_service_enable,
  $zidestore_service_flags = $opengroupware::params::zidestore_service_flags,
) inherits opengroupware::params {

  class { 'opengroupware::install':
    package_name   => $package_name,
    package_ensure => $package_ensure,
  }

  class { 'opengroupware::config':
    opengroupware_defaults_defaultvalues => $opengroupware_defaults_defaultvalues,
    opengroupware_defaults               => $opengroupware_defaults,
  }

  class { 'opengroupware::syslog':
    webui_service_ensure     => $webui_service_ensure,
    xmlrpcd_service_ensure   => $xmlrpcd_service_ensure,
    zidestore_service_ensure => $zidestore_service_ensure,
  }

  class { 'opengroupware::service':
    webui_service_name   => $webui_service_name,
    webui_service_ensure => $webui_service_ensure,
    webui_service_enable => $webui_service_enable,
    webui_service_flags  => $webui_service_flags,
    xmlrpcd_service_name   => $xmlrpcd_service_name,
    xmlrpcd_service_ensure => $xmlrpcd_service_ensure,
    xmlrpcd_service_enable => $xmlrpcd_service_enable,
    xmlrpcd_service_flags  => $xmlrpcd_service_flags,
    zidestore_service_name   => $zidestore_service_name,
    zidestore_service_ensure => $zidestore_service_ensure,
    zidestore_service_enable => $zidestore_service_enable,
    zidestore_service_flags  => $zidestore_service_flags,
  }

  Class['opengroupware::install'] ->
  Class['opengroupware::syslog'] ->
  Class['opengroupware::config'] ~>
  Class['opengroupware::service']
}
