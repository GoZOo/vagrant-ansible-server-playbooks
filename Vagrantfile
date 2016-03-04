# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "Lamp-dev-env"

  config.vm.box = "ubuntu/trusty64"

  config.ssh.forward_agent = true

  # IP network configuration.
  config.vm.network :private_network, ip: "33.33.33.20"

  # Shared folders.
  config.vm.synced_folder "data", "/home/vagrant/data", create: true, id: "vagrant-root",
    nfs: true

  # Provider-specific VM configuration.
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.cpus = 4
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    #vb.gui = true
  end

  # Anible provisionning.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.tags="common,drush"
    # If something goes wrong, you'll want Ansible to be more verbose.
    # ansible.verbose = true
  end

end
