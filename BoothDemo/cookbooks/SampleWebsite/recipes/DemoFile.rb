#
# Cookbook Name:: SampleWebsite
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


dsc_script 'DemoFile' do 
code <<-EOH
  File TestFile
  {
    Ensure = "Present"
    DestinationPath = "c:\\boothdemo\\TestFile.txt"
    Contents = "Hello World dsc_script"
  }
EOH
end


	
