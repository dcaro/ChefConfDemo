#
# Cookbook Name:: SampleWebsite
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

dsc_script 'DemoFile' do 
code <<-DEMOSCRIPT
  File TestFile
  {
    Ensure ="Present"
    DestinationPath ="c:\\demowebsite\\TestFile.txt"
    Content = "Hello World from dsc_script"
  }

DEMOSCRIPT
end
