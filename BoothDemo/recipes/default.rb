#
# Cookbook Name:: BoothDemo
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# This recipe create a file using dsc_script

dsc_script 'DemoFile' do 
code <<-DEMOSCRIPT
  File TestFile
  {
    Ensure ="Present"
    DestinationPath ="c:\\demo\\TestFile.txt"
    Content = "Hello World from dsc_script"
  }

DEMOSCRIPT
end
