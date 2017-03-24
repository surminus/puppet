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
                   ]
  }

  nginx::resource::server { 'preview.agender.org.uk':
    www_root    => '/data/www/agender-preview/htdocs',
    server_name => ['preview.agender.org.uk']
  }

  vcsrepo { '/data/www/agender':
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/surminus/agender.git',
    revision => 'master',
    notify   => Service['nginx'],
  }

  vcsrepo { '/data/www/agender-preview':
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/surminus/agender.git',
    revision => 'preview',
    notify   => Service['nginx'],
  }

}
