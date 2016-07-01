# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  # Ensure we use our vagrant private key
  config.ssh.insert_key = false
  config.ssh.private_key_path = '~/.vagrant.d/insecure_private_key'

  config.vm.define 'anxs' do |machine|
    machine.vm.box = "debian/jessie64"

    machine.vm.network :private_network, ip: '192.168.55.55'
    machine.vm.hostname = 'jarservice.local'
    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.sudo = true
      ansible.inventory_path = 'inventory'
      ansible.host_key_checking = false
    end

  end

end
