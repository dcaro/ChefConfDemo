#
# Cookbook Name:: SampleWebsite
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

dsc_script 'Setup IIS' do
  #imports 'xwebadministration'
  code <<-SETUPIIS
    windowsfeature 'iis'
    {
      Name = 'web-server'
      Ensure = 'present'
    }

    service 'w3svc'
    {
      Name = 'w3svc'
      StartupType = 'Automatic'
      State = 'Running'
    }

  SETUPIIS
end

#    xWebSite 'Shutdown Default Website'
#    {
#      Name = 'Default Web Site'
#      State = 'Stopped'
#      PhysicalPath = 'C:\\inetpub\\wwwroot\\'
#    }

template "c:\\inetpub\\wwwroot\\default.htm" do
  source "default.htm.erb"
  variables(
      :site_name => "Clown")

end

