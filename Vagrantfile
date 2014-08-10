# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/precise64nocm"

  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box"

  # Create a forwarded port mapping
  config.vm.network "forwarded_port", guest: 3000, host: 4567

  # SSH connections made will enable agent forwarding.
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "shell", path: "provision/bootstrap.sh"

  ruby_version_file=File.join(File.basename(__FILE__), '.ruby-version')
  ruby_version=File.exist?(ruby_version_file) ? `cat #{ruby_version_file}` : '2.0.0-p247'

  config.vm.provision "shell" do |s|
    s.privileged = false
    s.inline = "ansible-playbook $*"
    s.args = "/vagrant/provision/main.yml -i /vagrant/provision/inventory/local --extra-vars 'ruby_version=#{ruby_version}' --connection=local"
  end
end
