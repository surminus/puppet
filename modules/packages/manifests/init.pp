# == Class: Packages
class packages (
  $software,
) {
  validate_array($software)
  package {
    $software: ensure => 'installed'
  }

  service { [ 'postfix', 'unattended-upgrades']:
    ensure => running
  }
}
