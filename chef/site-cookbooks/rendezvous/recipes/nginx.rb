package "nginx-extras"

# remove default nginx config
default_path = "/etc/nginx/sites-enabled/default"
execute "rm -f #{default_path}" do
  only_if { File.exists?(default_path) }
end

# set custom nginx config
template "/etc/nginx/sites-enabled/#{node['app']['name']}" do
  source "nginx.conf.erb"
  mode 0644
  owner node['user']['name']
  group node['group']
  notifies :restart, "service[nginx]", :delayed
end
