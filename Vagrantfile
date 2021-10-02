# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vagrant.plugins = ["vagrant-vyos"]

  config.ssh.insert_key = false

  config.vm.define "rt-1" do |c|
    c.vm.box = "kun432/vyos"
    c.vm.hostname = "rt-1.internal"
    c.vm.network "private_network", ip: "192.168.1.1", virtualbox__intnet: "intnet1"
    c.vm.network "private_network", ip: "10.10.1.1", virtualbox__intnet: "rtnet1"
    c.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 512
    end
    c.vm.provision :shell, :path => "scripts/setup_rt1.sh"
  end

  config.vm.define "rt-2" do |c|
    c.vm.box = "kun432/vyos"
    c.vm.hostname = "rt-2.internal"
    c.vm.network "private_network", ip: "192.168.2.1", virtualbox__intnet: "intnet2"
    c.vm.network "private_network", ip: "10.10.1.2", virtualbox__intnet: "rtnet1"
    c.vm.network "private_network", ip: "10.10.2.1", virtualbox__intnet: "rtnet2"
    c.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 512
    end
    c.vm.provision :shell, :path => "scripts/setup_rt2.sh"
  end

  config.vm.define "rt-3" do |c|
    c.vm.box = "kun432/vyos"
    c.vm.hostname = "rt-3.internal"
    c.vm.network "private_network", ip: "192.168.3.1", virtualbox__intnet: "intnet3"
    c.vm.network "private_network", ip: "10.10.2.2", virtualbox__intnet: "rtnet2"
    c.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 512
    end
    c.vm.provision :shell, :path => "scripts/setup_rt3.sh"
  end

  (1..3).each do |n|
    config.vm.define "pc-#{n}" do |c|
      c.vm.box = "ubuntu/bionic64"
      c.vm.hostname = "pc-#{n}.internal"
      c.vm.network "private_network", ip: "192.168.#{n}.11", virtualbox__intnet: "intnet#{n}"
      c.vm.provider "virtualbox" do |v|
        v.gui = false
        v.memory = 512
      end
      c.vm.provision :shell, :run => "always", :inline => <<-EOT
        ip route delete default via 10.0.2.2
        ip route add default via 192.168.#{n}.1
      EOT
    end
  end
end
