# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y puppet
    if [ ! -L /etc/puppet ]; then
      sudo mv /etc/puppet /etc/puppet-old
      sudo ln -s /vagrant /etc/puppet
    fi
    sudo puppet apply --modulepath=/etc/puppet/modules:/etc/puppet/vendor/modules /etc/puppet/manifests/init.pp
  SHELL
end
