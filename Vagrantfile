# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "shell", inline: <<-SHELL
    if [ ! -e /usr/bin/puppet ]; then
      echo "Installing Puppet"
      sudo apt-get update -qq
      sudo apt-get install -qq puppet
    fi
    if [ ! -L /etc/puppet ]; then
      echo "Linking Puppet directory"
      sudo mv /etc/puppet /etc/puppet-old
      sudo ln -s /vagrant /etc/puppet
    fi
    sudo puppet apply --modulepath=/etc/puppet/modules:/etc/puppet/vendor/modules /etc/puppet/manifests/init.pp
  SHELL
end
