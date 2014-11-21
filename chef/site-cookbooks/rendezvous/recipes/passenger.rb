include_recipe "apt"

# Add HTTPS support to APT
package "apt-transport-https"

# Add the passenger repository
apt_repository "passenger-ppa" do
  uri "https://oss-binaries.phusionpassenger.com/apt/passenger"
  distribution "trusty"
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "561F9B9CAC40B2F7"
  action :add
end

execute "apt-get update"

package "passenger"
