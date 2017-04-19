# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "bento/centos-7.3"

  config.vm.network "private_network", ip: "192.168.33.20"

  config.omnibus.chef_version = "12.19.36"

  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = [
        "./chef-repo/cookbooks",
        "./chef-repo/site-cookbooks"
    ]
    chef.roles_path = "./chef-repo/roles"
    chef.add_role "common"
    chef.add_role "database"
    chef.add_role "web"
    chef.nodes_path = "./chef-repo/nodes"
    chef.node_name = "default"
    chef.environments_path = "./chef-repo/environments"
    chef.environment = "dev"
  end

end
