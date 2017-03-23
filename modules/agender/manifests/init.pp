# == Class: Agender
#
class agender {
  class { 'nginx':
    log_dir => '/data/logs',
  }

  file { ['/data/', '/data/www']:
    ensure => directory,
  }

  nginx::resource::server { 'www.agender.org.uk':
    www_root    => '/data/www/agender/htdocs',
    server_name => ['www.agender.org.uk',
                    'agender.org.uk',
                    'agender.surminus.co.uk',
                    'preview.agender.org.uk',
                   ]
  }

  vcsrepo { '/data/www/agender':
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/surminus/agender.git',
    revision => 'master',
    notify   => Service['nginx'],
  }

}
