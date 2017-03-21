# == Class: Agender
#
class agender {
  include nginx

  nginx::resource::server { 'www.agender.org.uk':
    www_root    => '/var/www/agender/htdocs',
    server_name => ['www.agender.org.uk',
                    'agender.org.uk',
                    'agender.surminus.co.uk',
                    'preview.agender.org.uk',
                   ]
  }

  vcsrepo { '/var/www/agender':
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/surminus/agender.git',
    revision => 'master',
    notify   => Service['nginx'],
  }

}
