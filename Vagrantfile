# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "bento/centos-6.7"

  config.vm.network "private_network", ip: "192.168.33.20"

  config.omnibus.chef_version=:latest

  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = [
        "./chef-repo/cookbooks",
        "./chef-repo/site-cookbooks"
    ]
    chef.roles_path = "./chef-repo/roles"
    chef.add_role "common"
    #chef.environments_path = "./chef-repo/environments"
    #chef.environment = "st"
  end

end