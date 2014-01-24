# -*- mode: ruby -*-
# vi: set ft=ruby :

fail "You must set PUPPET_HOME to proceed" if ENV['PUPPET_HOME'] == nil
PUPPET_HOME= ENV['PUPPET_HOME']

Vagrant.configure("2") do |config|
  config.vm.hostname = 'puppet-wal-e'
  config.vm.synced_folder "#{PUPPET_HOME}/modules/apt", "/tmp/apt"
  config.vm.synced_folder "#{PUPPET_HOME}/modules/concat", "/tmp/concat"
  config.vm.synced_folder "#{PUPPET_HOME}/modules/firewall", "/tmp/firewall"
  config.vm.synced_folder "#{PUPPET_HOME}/modules/postgresql", "/tmp/postgresql"
  config.vm.synced_folder "#{PUPPET_HOME}/modules/stdlib", "/tmp/stdlib"
  config.vm.synced_folder ".", "/tmp/wal_e"

  #config.vm.define "centos" do |centos|
  #  centos.vm.box     = 'centos64'
  #  centos.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box'
  #  centos.vm.provision :puppet do |puppet|
  #    puppet.manifests_path = "tests"
  #    puppet.manifest_file  = "vagrant.pp"
  #    puppet.options        = ["--modulepath", "/tmp"]
  #  end
  #end

  #config.vm.define "suse" do |suse|
  #  suse.vm.box     = 'suse64'
  #  suse.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/sles-11sp1-x64-vbox4210.box'
  #  suse.vm.provision :shell, :inline => "sudo zypper mr --disable 1"
  #  suse.vm.provision :puppet do |puppet|
  #    puppet.manifests_path = "tests"
  #    puppet.manifest_file  = "vagrant.pp"
  #    puppet.options        = ["--modulepath", "/tmp", "--ordering", "random"]
  #  end
  #end

  config.vm.define "ubuntu", primary: true do |ubuntu|
    ubuntu.vm.box     = 'ubuntu64'
    ubuntu.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box'
    ubuntu.vm.provision :shell, :inline => 'aptitude update'
    ubuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp"]
    end
  end

end
