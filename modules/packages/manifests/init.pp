class packages {
  $software = [ 'screen', 'git' ]

  package {
    $software: ensure => 'installed'
  }
}
