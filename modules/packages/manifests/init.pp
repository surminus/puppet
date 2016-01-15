class packages {
  $software = [
    'screen',
    'git',
    'postfix',
  ]

  package {
    $software: ensure => 'installed'
  }

  service { 'postfix':
    ensure => running
  }
}
