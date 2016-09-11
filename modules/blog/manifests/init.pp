# Remove when deployed
class blog (
  $user = 'laura',
  $home = '/home/laura',
) {
  package { 'nginx':
    ensure => absent,
  }

  file { "${home}/blog":
    ensure => absent,
  }
}
