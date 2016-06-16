class packages {
  $software = [
    'screen',
    'git',
    'postfix',
    'unattended-upgrades',
  ]

  package {
    $software: ensure => 'installed'
  }

  service { [ 'postfix', 'unattended-upgrades']:
    ensure => running
  }
}
