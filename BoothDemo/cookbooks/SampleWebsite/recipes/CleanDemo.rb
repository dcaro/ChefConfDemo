

directory 'c:\\boothdemo' do
	recursive true
	action :delete
end


dsc_script 'Remove IIS' do
  code <<-REMOVEIIS
    windowsfeature 'iis'
    {
      Name = 'web-server'
      Ensure = 'absent'
    }

  REMOVEIIS
end


directory "c:\\inetpub" do
	recursive true
	action :delete
end

reboot "app_requires_reboot" do
  action :request_reboot
  reason "Need to reboot when the run completes successfully."
  delay_mins 5
end