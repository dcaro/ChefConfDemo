

dsc_script 'Setup IIS' do
  imports 'xwebadministration'
  code <<-SETUPIIS
    windowsfeature 'iis'
    {
      Name = 'web-server'
      Ensure = 'present'
    }

    service 'W3SVC'
    {
      Name = 'W3SVC'
      StartupType = 'Automatic'
      State = 'Running'
    }

    xWebSite 'Shutdown Default Website'
    {
      Name = 'Default Web Site'
      State = 'Stopped'
      PhysicalPath = 'C:\\inetpub\\wwwroot\\'
    }
  SETUPIIS
end

node['iis_demo']['sites'].each do |site_name, site_data|
  site_dir = "#{ENV['SYSTEMDRIVE']}\\inetpub\\wwwroot\\#{site_name}"
  dsc_script "Configure Site #{site_name}" do
    imports 'xwebadministration'
    code <<-SITESDSC
      $SiteDir = '#{site_dir}'
      file "#{site_name} Directory"
      {
        DestinationPath = $SiteDir
        Type = 'Directory'
      }
      xWebAppPool "#{site_name} App Pool"
      {
        Name = "#{site_name}-AppPool"
      }
      xWebSite "#{site_name} Web Site"
      {
        Name = '#{site_name}'
        ApplicationPool = "#{site_name}-AppPool"
        BindingInfo = MSFT_xWebBindingInformation
                     {
                       Protocol              = "HTTP"
                       Port                  = #{site_data['port']}
                     }
        PhysicalPath = $SiteDir
      }
    SITESDSC
  end

template "#{site_dir}\\default.htm" do
  source "default.htm.erb"
  variables(
      :site_name => site_name,
      :port => site_data['port']
      )
end

end