#
# Cookbook Name:: SampleWebsite
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
file "c:\\demoweb\\test.txt" do
	content 'Hello World Chef'
end

dsc_script 'DemoFile' do 
code <<-EOH
  File TestFile
  {
    Ensure = "Present"
    DestinationPath = "c:\\demoweb\\TestFile.txt"
    Contents = "Hello World dsc_script"
  }
EOH
end


	
