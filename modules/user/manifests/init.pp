# == Class: User
#
class user {
  #  include sudo
  user { 'laura':
    ensure     => present,
    comment    => 'Laura Martin',
    home       => '/home/laura',
    managehome => true,
    shell      => '/bin/bash',
  }

  file { '/home/laura/.ssh':
    ensure => directory,
    owner  => 'laura',
    group  => 'laura',
    mode   => '0700',
  }

  file { '/home/laura/.ssh/authorized_keys':
    ensure => present,
    owner  => 'laura',
    group  => 'laura',
    source => 'puppet:///modules/user/laura/authorized_keys',
    mode   => '0644',
  }

}
