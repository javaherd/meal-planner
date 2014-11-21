#
# Cookbook Name:: rendezvous
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# update package database
execute "apt-get update"

# install packages
package "postfix"
package "curl"
package "git-core"
package "zlib1g-dev"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "libxml2-dev"
package "libxslt1-dev"
package "libpq-dev"
package "build-essential"
package "tree"
package "apt-transport-https"
package "ca-certificates"

# set timezone
bash "set timezone" do
  code <<-EOH
    echo 'EU/Dublin' > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
  EOH
  not_if "date | grep -q 'GMT'"
end

# Add passenger apt repo
apt_repository "nginx-php" do
    uri "https://oss-binaries.phusionpassenger.com/apt/passenger"
    distribution "trusty"
    components ["main"]
    keyserver "keyserver.ubuntu.com"
    key "561F9B9CAC40B2F7"
end
