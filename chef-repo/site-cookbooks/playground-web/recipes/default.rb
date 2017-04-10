#
# Cookbook Name:: playground-web
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'php' do
    action :remove
end

package 'libicu-devel' do
  action :install
end
