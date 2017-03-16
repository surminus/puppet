# == Class: Agender
#
class agender {
  include nginx

  nginx::resource::vhost { 'www.agender.org.uk':
    www_root => '/var/www/agender/htdocs',
  }

  vcsrepo { '/var/www/agender':
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/surminus/agender.git',
    revision => 'master',
    before   => Nginx::Resource::Vhost['www.agender.org.uk'],
  }

}
