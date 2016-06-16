class user {
  include sudo
  user { 'laura':
    ensure     => present,
    comment    => 'Laura Martin',
    home       => '/home/laura',
    managehome => true,
  }

  sudo::conf { 'laura':
    priority => 10,
    content  => "laura ALL=(ALL) NOPASSWD: ALL",
  }

  file { '/home/laura/.ssh':
    ensure => directory,
    owner  => 'laura',
    group  => 'laura',
    mode   => '700',
  }

  file { '/home/laura/.ssh/authorized_keys':
    ensure => present,
    owner  => 'laura',
    group  => 'laura',
    source => "puppet:///modules/user/laura/authorized_keys",
    mode   => '0644',
  }

}
