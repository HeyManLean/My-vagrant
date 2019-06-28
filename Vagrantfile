# -*- mode: ruby -*-
# vi: set ft=ruby :

# 插件
required_plugins = %w(vagrant-share vagrant-vbguest vagrant-disksize)
return if !Vagrant.plugins_enabled?
plugins_to_install = required_plugins.select { |plugin| !Vagrant.has_plugin? plugin }
if plugins_to_install.any?
  system "vagrant plugin install #{plugins_to_install.join(' ')}"
  exit system 'vagrant up'
end

Vagrant.configure("2") do |config|
  # config.vm.box = "generic/ubuntu1804"
  config.vm.box = "ubuntu/bionic"
  config.vm.hostname = "dev"
  config.vm.box_check_update = false
  config.disksize.size = '24GB'

  # 共享端口
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # 设置网络
  config.vm.network "private_network", type: "dhcp"
  config.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"

  # 共享文件夹(默认共享当前目录至/vagrant)
  config.vm.synced_folder "/Users/heymanlean/workspaces/lewan", "/home/vagrant/vhost"

  # 配置
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6144"
    vb.cpus = 3
  end

  $script = "/bin/bash --login /vagrant/bootstrap.sh"
  config.vm.provision :shell, privileged: false, inline: $script
end
