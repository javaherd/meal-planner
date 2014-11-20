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
    vb.customize ["modifyvm", :id, "--memory", "1024"]
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
        :rvm => {
            :default_ruby => "ruby-2.1.5",
            :gems => {
                "ruby-2.1.5" => [
                    {:name => "bundler"},
                    {:name => "rake"},
                    {:name => "rails", :version => "4.1.8" }
                ],
            },
            :rvm_string => "ruby-2.1.5",
            :vagrant => {
                :system_chef_solo => '/usr/bin/chef-solo'
            }
        },
        :nginx => {
            :version => "1.6.2",
            :dir => "/etc/nginx",
            :log_dir => "/var/log/nginx",
            :binary => "/opt/nginx-1.6.2/sbin",
            :user => "develop",
            :init_style => "init",
            :source => {
                :modules => [
                    "nginx::http_stub_status_module",
                    "nginx::http_ssl_module",
                    "nginx::http_gzip_static_module",
                    "nginx::passenger",
                ]
            },
            :passenger => {
                :version => "4.0.53",
                :ruby => "/usr/local/rvm/rubies/ruby-2.1.5/bin/ruby",
                :root => "/usr/local/rvm/gems/ruby-2.1.5/gems/passenger-4.0.53",
                :gem_binary => "/usr/local/rvm/wrappers/ruby-2.1.5/gem"
            },
        }
    }

    # Install the chef cookbooks
    #chef.add_recipe "rendezvous"
    #chef.add_recipe "rendezvous::nodejs"
    #chef.add_recipe "rendezvous::passenger"
    #chef.add_recipe "rendezvous::postgres"
    #chef.add_recipe "rendezvous::rbenv"
    #chef.add_recipe "rendezvous::redis"
    #chef.add_recipe "nginx"
    chef.add_recipe 'apt'
    chef.add_recipe 'build-essential'
    chef.add_recipe "rvm::system"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe 'rvm::gem_package'
    chef.add_recipe "nginx::source"
    #chef.add_recipe "rendezvous::nginx"
    #chef.add_recipe "rendezvous::app"
  end
end
