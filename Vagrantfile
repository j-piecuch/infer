# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'etc'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
  config.vm.provider "docker" do |d|
    d.build_dir = "./docker/build-env"
    uid = Etc.getpwnam(ENV['USER']).uid.to_s
    d.build_args = [ "--build-arg", "uid=" + uid ]
    d.has_ssh = true
  end
  config.ssh.private_key_path = "./docker/build-env/insecure_key"
end
