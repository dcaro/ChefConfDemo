
dsc_resource 'Install IIS' do
  resource :windowsfeature
  property :name,  'web-server'
end

service "w3svc" do
  action [:enable, :start ]
end

template "c:\\inetpub\\wwwroot\\Default.htm" do
    source "Default.htm.erb"
    rights :read, "Everyone"
    variables(
        :site_name => "Clows"        
        )
    notifies :restart, "service[w3svc]"
  end

