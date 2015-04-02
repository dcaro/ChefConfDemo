#
# Cookbook Name:: databagdemo
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user = data_bag_item('users', 'steve')

dsc_resource "newuser" do
  resource :user
  property :username, user['id']
  property :password, ps_credential(user['password'])
end