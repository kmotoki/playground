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

include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
package node['apache']['devel_package']
apache_conf 'php' do
    cookbook 'apache2'
    source 'mods/php.conf.erb'
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

include_recipe "php"
include_recipe "composer"

execute 'install_cakephp' do
  command "composer self-update && composer create-project --prefer-dist --no-interaction cakephp/app #{node['playground-web']['cake_dir']}"
end

web_app node['playground']['hostname'] do
    cookbook 'apache2'
    server_name node['playground']['hostname']
    docroot "#{node['playground-web']['cake_dir']}/webroot"
end
