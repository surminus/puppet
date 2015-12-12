node default {
  include puppet-sync
  include user
  include sudo
  include packages
}
