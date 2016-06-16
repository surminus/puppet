class packages {
  $software = [
    'bundler',
    'git',
    'postfix',
    'ruby',
    'screen',
    'unattended-upgrades',
  ]

  package {
    $software: ensure => 'installed'
  }

  service { [ 'postfix', 'unattended-upgrades']:
    ensure => running
  }
}
