class blog (
  $user = 'laura',
  $home = '/home/laura',
  $ruby_version = '2.0.0-p648',
) {
  include nginx

  nginx::resource::vhost { 'blog.surminus.co.uk':
    listen_port => 80,
    proxy       => 'http://localhost:4000',
  }

  vcsrepo { "$home/blog":
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/surminus/blog.git',
    revision => 'master',
    user     => $user,
  }

  rbenv::compile { $ruby_version: user => $user, home => $home, global => true }
  rbenv::install { $user: group => $user, home => $home }
}
