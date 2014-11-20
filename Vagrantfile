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
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Give the virtual machine an IP
  config.vm.network 'private_network', ip: "192.145.1.23"

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 22, host: 6351

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

      :group => "vagrant",

      :nginx => {
        :version => "1.4.1",
        :dir => "/etc/nginx",
        :log_dir => "/var/log/nginx",
        :binary => "/opt/nginx-1.4.1/sbin",
        :user => "develop",
        :init_style => "init",
        :passenger => {
            :ruby => "/home/vagrant/.rbenv/shims/ruby",
        }
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
    chef.add_recipe "rendezvous::nodejs"
    chef.add_recipe "rendezvous::passenger"
    chef.add_recipe "rendezvous::postgres"
    chef.add_recipe "rendezvous::rbenv"
    chef.add_recipe "rendezvous::redis"
    chef.add_recipe "nginx"
    chef.add_recipe "nginx::passenger"
    chef.add_recipe "rendezvous::nginx"
    chef.add_recipe "rendezvous::app"
  end
end
