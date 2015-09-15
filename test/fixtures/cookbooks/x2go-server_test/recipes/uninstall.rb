# Encoding: UTF-8

include_recipe 'x2go-server'

x2go_server 'default' do
  action :remove
end
