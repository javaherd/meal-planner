# Install app bundle
execute 'bundle install' do
    cwd "/var/www/#{node['app']['name']}/"
    not_if 'bundle check' # This is not run inside /myapp
end
