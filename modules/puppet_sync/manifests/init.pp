# == Class: Puppet_sync
class puppet_sync {
    file { 'post-merge':
        ensure => file,
        path   => '/etc/puppet/.git/hooks/post-merge',
        source => 'puppet:///modules/puppet-sync/post-merge',
        mode   => '0755',
        owner  => root,
        group  => root,
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => 'cd /etc/puppet ; /usr/bin/git pull',
        user    => root,
        minute  => '*/15',
        require => File['post-merge'],
    }
}
