# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = ["vagrant-hostsupdater" , "vagrant-berkshelf", "vagrant-puppet-install"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.define "wildfly" do |app|
    app.vm.box_check_update = false

    app.vm.box = "nrel/CentOS-6.7-x86_64"
    app.vm.box_version = "1.0.0"

    app.vm.network "private_network", ip: "192.168.33.10"
    app.hostsupdater.aliases = ["wildfly.local"]

    app.vm.synced_folder "./app", "/home/vagrant"

    app.puppet_install.puppet_version = "5.3.3"
    app.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "/Users/karlgharios/Wildfly/app/wildfly/manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "/Users/karlgharios/Wildfly/app/wildfly/modules"
    end

  end

  # Eventually, when both modules are ready, this is the synthax that would
  # have to be user :


  # config.vm.define "web" do |web|
  #   web.vm.box_check_update = false

  #   web.vm.box = "nrel/CentOS-6.7-x86_64"
  #   web.vm.box_version = "1.0.0"

  #   web.vm.network "private_network", ip: "192.168.33.10"
  #   web.hostsupdater.aliases = ["wildfly.local"]

  #   web.vm.synced_folder "./app", "/home/vagrant"

  #   web.puppet_install.puppet_version = "5.3.3"
  #   web.vm.provision "puppet" do |puppet|
  #     puppet.manifests_path = "/Users/karlgharios/Wildfly/app/wildfly/manifests"
  #     puppet.manifest_file = "site.pp"
  #     puppet.module_path = "/Users/karlgharios/Wildfly/app/wildfly/modules"
  #   end

  # end

  # config.vm.define "oradb" do |db|

  #   db.vm.box_check_update = false

  #   db.vm.box = "nrel/CentOS-6.7-x86_64"
  #   db.vm.box_version = "1.0.0"

  #   db.vm.network "private_network", ip: "192.168.33.11"
  #   db.hostsupdater.aliases = ["oradb.local"]

   
  #   db.vm.synced_folder "./db", "/home/vagrant"

  #   db.puppet_install.puppet_version = "5.3.3"
  #   db.vm.provision "puppet" do |puppet|
  #     puppet.manifests_path = "/Users/karlgharios/Wildfly/db/"
  #     puppet.manifest_file = "site.pp"
  #     puppet.module_path = "/Users/karlgharios/Wildfly/db/"
  #   end

  #   db.vm.provider "virtualbox" do |v|
  #       v.memory = 2048
  #       v.cpus = 2
  #   end

  # end
  
end
