# Class: monyog
class monyog (
  $package  = 'IderaSQLdmforMySQL',
  $source,
  $service  = 'MONyogd',
  $basedir  = '/usr/local/MONyog',
  $inifile  = "${basedir}/MONyog.ini",
  $port     = 5555,
  $firewall = false,
) {

  package { $package:
    ensure   => installed,
    source   => $source,
    provider => 'rpm',
  }

  ini_setting { 'Port':
    path    => $inifile,
    section => 'GENERAL',
    setting => 'Port',
    value   => $port,
    require => Package[$package],
    notify  => Service[$service],
  }

  if $firewall {
    firewall { '100-monyog':
      proto  => 'tcp',
      dport  => $port,
      action => 'accept',
    }
  }

  service { $service:
    ensure  => running,
    enable  => true,
    require => Package[$package],
  }

}
