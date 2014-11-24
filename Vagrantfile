# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"

  #Share the app folder with the VM
  config.vm.synced_folder ".", "/var/www/"

  # Configurate the virtual machine to use 1GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Give the virtual machine an IP
  config.vm.network 'private_network', ip: "192.145.1.23"

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    # Define the chef variables
    chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
    chef.data_bags_path = "chef/data_bags"

    chef.json = {
        :user => {
            :name => "vagrant",
        },
        :group => "vagrant",
        :app => {
            :name => "rendezvous",
            :env => 'development'
        },
        :rvm => {
            :default_ruby => "ruby-2.1.5",
            :gems => {
                "ruby-2.1.5" => [
                    {:name => "bundler"},
                    {:name => "rake"},
                    {:name => "rails", :version => "4.1.8" },
                    {:name => "pg", :version => "0.17.1"}
                ],
            },
            :rvm_string => "ruby-2.1.5",
            :vagrant => {
                :system_chef_solo => '/usr/bin/chef-solo'
            }
        },
        :nginx => {
            :version => "1.6.2",
            # :dir => "/etc/nginx",
            # :log_dir => "/var/log/nginx",
            # :binary => "/opt/nginx-1.6.2/sbin",
            # :user => "develop",
            # :init_style => "init",
            # :source => {
            #     :modules => [
            #         "nginx::http_stub_status_module",
            #         "nginx::http_ssl_module",
            #         "nginx::http_gzip_static_module",
            #         "nginx::passenger",
            #     ]
            # },
            :passenger => {
                :version => "4.0.53",
                :ruby => "/usr/local/rvm/gems/ruby-2.1.5/wrappers/ruby",
                :root => "/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini",
            },
        },
        :postgresql => {
            :password => {
                # Username: postgres, Password: devpassword
                :postgres => "6380c69680dd5739137fbed091c03108"
            }
        }
    }

    ## Install the chef cookbooks ##

    # Basic utils apt, git etc. Add Phusion PPA
    chef.add_recipe "rendezvous"

    # node js install
    chef.add_recipe "rendezvous::nodejs"

    # RVM install
    chef.add_recipe "rvm::system"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe 'rvm::gem_package'

    # Nginx install (using phusion pre compilled binaries)
    chef.add_recipe "nginx"
    chef.add_recipe "nginx::passenger"
    chef.add_recipe "rendezvous::nginx"

    # Postgres install
    chef.add_recipe "postgresql"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "rendezvous::postgres"

    # Redis install
    chef.add_recipe "redisio"
    chef.add_recipe "redisio::enable"

    # Rendezvous app setup (bundle install etc.)
    # chef.add_recipe "rendezvous::app"

  end
end
