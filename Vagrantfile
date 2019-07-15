# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
  config.vm.provider "docker" do |d|
    d.build_dir = "./docker/build-env"
    d.build_args = [ "--build-arg", "uid=" + Process.uid.to_s ]
    d.has_ssh = true
  end
  config.ssh.private_key_path = "./docker/build-env/insecure_key"
end
