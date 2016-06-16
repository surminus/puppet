class blog {
  include nginx

  nginx::resource::vhost { 'blog.surminus.co.uk':
    listen_port => 80,
    proxy       => 'http://localhost:4000',
  }

  file { '/var/www':
    ensure => 'directory',
  }

  vcsrepo { '/var/www/blog':
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/surminus/blog.git',
    revision => 'master',
    require  => Package['bundler'],
  }

  file { '/var/www/blog/.git/hooks/post-merge':
    ensure  => 'present',
    source  => 'puppet:///modules/blog/post-merge',
    mode    => 0755,
    owner   => root,
    group   => root,
  }

  exec { 'Start Jekyll':
    path        => '/usr/bin',
    command     => 'bundle exec jekyll serve',
    cwd         => '/var/www/blog',
    subscribe   => File['/var/www/blog'],
    refreshonly => true,
    logoutput   => true,
  }
}
