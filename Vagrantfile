# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network :public_network, :bridge => "wlan0"
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize [ "modifyvm", :id, "--memory", "1024" ]
  end
  config.vm.define "x86", :primary => true do |x86|
    # This will fetch the box from vagrantcloud.com
    x86.vm.box = "Geod24/dev-x86"
  end
end
