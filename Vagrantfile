# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # https://www.vagrantup.com/docs/boxes.html#official-boxes
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.box_version = "201812.27.0"
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    # https://groups.google.com/forum/#!topic/vagrant-up/eZljy-bddoI
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    # https://stackoverflow.com/questions/45678817/error-etxtbsy-text-file-is-busy-on-npm-install
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
    vb.memory = 2048
  end

  # https://stackoverflow.com/questions/22547575/execute-commands-as-user-after-vagrant-provisioning
  config.vm.provision :shell, path: 'setup_ubuntu.sh', privileged: false
end
