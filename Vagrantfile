# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provision "shell", inline: <<-SHELL
      echo "Installing Puppet"
      sudo apt-get update -qq
      sudo apt-get install -qq puppet bundler
    if [ ! -L /etc/puppet ]; then
      echo "Linking Puppet directory"
      sudo mv /etc/puppet /etc/puppet-old
      sudo ln -s /vagrant /etc/puppet
    fi
    cd /etc/puppet
    bundle install
    bundle exec librarian-puppet install
    sudo puppet apply --modulepath=/etc/puppet/modules:/etc/puppet/vendor/modules /etc/puppet/manifests/init.pp
  SHELL
end
