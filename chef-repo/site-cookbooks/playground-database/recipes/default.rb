#
# Cookbook Name:: playground-database
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/mysql57-community-release-el6-9.noarch.rpm" do
  source 'http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm'
  action :create
end

rpm_package 'mysql-community-release' do
  source "#{Chef::Config[:file_cache_path]}/mysql57-community-release-el6-9.noarch.rpm"
  action :install
end

mysql_service 'default' do
  port '3306'
  version '5.7'
  socket '/var/lib/mysql/mysql.sock'
  initial_root_password 'password'
  action [:create, :start]
end
