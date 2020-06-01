# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.2.0"

Vagrant.configure("2") do |config|
  config.vm.box = "StefanScherer/windows_10"
  config.vm.box_version = "2020.04.05"
  config.vm.guest = :windows
  config.vm.box_check_update = true
  config.windows.halt_timeout = 10
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"
  config.vagrant.plugins = ["vagrant-vbguest"]

  # config.trigger.after :up do |trigger|
  #   # TODO: add this as a trigger after :up only once
  #   vagrant vbguest --do install
  # end

  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end


  config.vm.provider :virtualbox do |v, override|
    v.gui = true
    v.customize ["modifyvm", :id, "--memory", "4096"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--vram", 32]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--audio", "none"]
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    v.customize ["modifyvm", :id, "--draganddrop", "hosttoguest"]
    v.customize ["modifyvm", :id, "--usb", "off"]
    v.linked_clone = true 

    # add optical drive
    v.customize ["storageattach", :id,
                  "--storagectl", "IDE Controller",
                  "--port", "0", "--device", "1",
                  "--type", "dvddrive",
                  "--medium", "emptydrive"]
  end

  config.vm.define :ts32 do |node|
    node.vm.provision "shell", privileged: "true", powershell_elevated_interactive: "true", path: "./scripts/provision-vm.ps1"
  end
end
