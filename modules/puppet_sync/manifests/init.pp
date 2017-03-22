# == Class: Puppet_sync
class puppet_sync {
    file { 'post-merge':
        ensure => absent,
        path   => '/etc/puppet/.git/hooks/post-merge',
    }
    file { '/usr/local/bin/run-puppet':
        ensure => file,
        source => 'puppet:///modules/puppet_sync/run-puppet',
        mode   => '0755',
        owner  => root,
        group  => root,
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => '/usr/local/bin/run-puppet >/dev/null 2>&1',
        user    => root,
        minute  => '*/15',
        require => File['/usr/local/bin/run-puppet'],
    }
}
