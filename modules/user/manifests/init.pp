# == Class: User
#
class user (
  $ssh_keys,
) {
  user { 'laura':
    ensure     => present,
    comment    => 'Laura Martin',
    home       => '/home/laura',
    managehome => true,
    shell      => '/bin/bash',
  }

  include sudo

  create_resources(ssh_authorized_key, $ssh_keys)

  file { '/home/laura/pass':
    ensure => 'directory',
  }
}
