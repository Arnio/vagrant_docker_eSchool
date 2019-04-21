# -*- mode: ruby -*-
# vi: set ft=ruby :
# MAINDB="moodledb"
# USERDB="moodleus"
# PASSWDDB="moodle123"
databaseIP="192.168.56.5" #1-99
balancerIP="192.168.56.100" #1-99
ansibleIP="192.168.56.10" #1-99
network="192.168.56." # xxx.xxx.xxx.
NODE_COUNT = 2

BOX_IMAGE = "centos/7"

Vagrant.configure("2") do |config|
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 22, host: 2222

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "2048"
  end
 
  
  config.vm.define "ansible" do |ansconfig|
    ansconfig.vm.box = BOX_IMAGE
    ansconfig.vm.hostname = "ansible"
    ansconfig.vm.network :private_network, ip: ansibleIP
    ansconfig.vm.provision "file", source: "f:/SSHkey/devops095.pub", destination: "~/.ssh/authorized_keys"
    ansconfig.vm.provision "shell", path: "ansible_install.sh"
    ansconfig.vm.provision "file", source: "f:/SSHkey/devops095_ossh.pem", destination: "~/.ssh/#{ansibleIP}.pem"
    # (1..NODE_COUNT).each do |n|
    #   webIP="#{network}"+"#{n + 100}"
    #   webName="node#{n}"
    #   ansconfig.vm.provision "file", source: ".vagrant/machines/#{webName}/virtualbox/private_key", destination: "~/.ssh/#{webIP}.pem"
    #   if n==1
    #     ansconfig.vm.provision "shell", path: "scenarioAddFirstWeb.sh", :args => [webIP, webName]
    #   else
    #     ansconfig.vm.provision "shell", path: "scenarioAddWeb.sh", :args => [webIP, webName]
    #   end
      
    # end

    ansconfig.vm.provision "shell", path: "ansible.sh"

  end
  
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  

end