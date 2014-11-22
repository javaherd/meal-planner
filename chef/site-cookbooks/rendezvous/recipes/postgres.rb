# create new postgres user
execute "create new postgres user" do
  user "postgres"
  command "psql -c \"create user vagrant with password 'devpassword' SUPERUSER;\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname='vagrant'\" | wc -l`.chomp == "1" }
end

# create new postgres user
execute "create new postgres user" do
  user "postgres"
  command "psql -c \"create user #{node['app']['name']} with password 'devpassword' CREATEDB;\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname='#{node['app']['name']}'\" | wc -l`.chomp == "1" }
end

# create new postgres database
# execute "create new postgres database" do
#   user "postgres"
#   command "psql -c \"create database #{node['app']['name']} owner #{node['app']['name']}};\""
#   not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_database WHERE datname='#{node['app']['name']}'\" | wc -l`.chomp == "1" }
# end
