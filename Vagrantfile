# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"

  #Share the app folder with the VM
  config.vm.synced_folder ".", "/var/www/rendezvous"

  # Configurate the virtual machine to use 1GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    # Define the chef variables
    chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
    chef.data_bags_path = "chef/data_bags"

    chef.json = {
      "port" => 22,

      "user" => {
        "name" => "vagrant",
        "password" => "password-shadow-hash"
      },

      "db" => {
        "root_password" => "secret",
        "user" => {
          "name" => "bob",
          "password" => "secret"
        }
      }
    }

    # Install the chef cookbooks
    chef.add_recipe "rendezvous"
    chef.add_recipe "rendezvous::users"
    chef.add_recipe "rendezvous::ssh"
    chef.add_recipe "rendezvous::nodejs"
    chef.add_recipe "rendezvous::passenger"
    chef.add_recipe "rendezvous::postgres"
    chef.add_recipe "rendezvous::rbenv"
    chef.add_recipe "rendezvous::redis"
    chef.add_recipe "rendezvous::nginx"
    chef.add_recipe "rendezvous::app"
  end
end
