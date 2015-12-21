class opengroupware::install (
  $package_name,
  $package_ensure,
) {

  package { $package_name:
    ensure => $package_ensure,
  }

  $webdirs = [ '/var/www/htdocs/OpenGroupware55.woa', '/var/www/htdocs/NewsImages', '/var/www/htdocs/coordinates']

  file { $webdirs:
    ensure => 'directory',
    owner  => 'root',
    group  => '_opengroupware',
    mode   => '0775',
  }

  exec { 'copy opengroupware webresources':
    command => 'cp -R /usr/local/share/opengroupware/www /var/www/htdocs/OpenGroupware55.woa/WebServerResources',
    creates => '/var/www/htdocs/OpenGroupware55.woa/WebServerResources',
  }

  Package[$package_name] ->
  File[$webdirs] ->
  Exec['copy opengroupware webresources']

}
