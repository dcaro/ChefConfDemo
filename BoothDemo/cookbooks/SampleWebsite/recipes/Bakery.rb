
dsc_resource 'Install IIS' do
  resource :windowsfeature
  property :name,  'web-server'
end

service "w3svc" do
  action [:enable, :start ]
end

dsc_resource 'Install Asp.Net 4.5' do
	resource :windowsfeature
	property :name, 'Web-Asp-Net45'
end

dsc_resource 'Shutdown Default Website' do
  resource :xwebsite
  property :name, 'Default Web Site'
  property :State, 'Stopped'
  property :PhysicalPath, 'C:\inetpub\wwwroot'
end

dsc_resource 'Copy web site content' do
	resource :archive
	property :path, 'C:\Program Files\WindowsPowerShell\Modules\xWebAdministration\Examples\BakeryWebsite.zip'
	property :destination, 'c:\inetpub\wwwroot'
end

#dsc_resource 'Bakery web site' do
#	resource :xwebsite
#	property :Name, "FourthCoffee"
#	property :PhysicalPath, 'c:\intepub\wwwroot\BakeryWebsite'
#  property :State, 'Started'
#end

#Powershell script while we fix the xwebsite resource
powershell_script 'Create Bakery Website' do
  code <<-CREATEWEBSITE
    Import-Module WebAdministration
    if (-not(test-path IIS:\\Sites\\FourthCoffee)) {
    $NewWebsiteParams = @{Name= 'FourthCoffee';Port= 80;PhysicalPath= 'C:\\inetpub\\wwwroot\\BakeryWebsite';ApplicationPool= 'DefaultAppPool'}
    New-Website @NewWebsiteParams 
    }
  CREATEWEBSITE
end
