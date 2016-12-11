template "/etc/init/pathfinder.conf" do
  source 'pathfinder.upstart.conf.erb'
  owner 'root'
  group 'root'
  mode '0744'
  variables({
    :name => node['pathfinder']['api']['name'],
    :src_dir => "/opt/#{node['pathfinder']['api']['name']}"
  })
end

service "pathfinder" do
  action [:enable, :start]
end