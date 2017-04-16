#
# Cookbook Name:: playground-web
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'mariadb-libs' do
    action :remove
end

remote_file "#{Chef::Config[:file_cache_path]}/mysql57-community-release-el6-9.noarch.rpm" do
  source 'http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm'
  action :create
end

rpm_package 'mysql-community-release' do
  source "#{Chef::Config[:file_cache_path]}/mysql57-community-release-el6-9.noarch.rpm"
  action :install
end

package node['apache']['devel_package']

web_app 'my_app' do
    cookbook 'apache2'
    server_name node['playground']['hostname']
    docroot node['apache']['docroot_dir']
end

package 'php' do
    action :remove
end

directory node['php']['ext_conf_dir'] do
    recursive true
    action :delete
end

package 'libicu-devel' do
  action :install
end
