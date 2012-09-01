# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  config.vm.provision :puppet, :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "site.pp"
  end

  config.vm.define :server do |server|
    server.vm.network :hostonly, "192.168.10.10"
    server.vm.host_name = "server.example.com"
  end

  config.vm.define :worker1 do |worker|
    worker.vm.network :hostonly, "192.168.10.11"
    worker.vm.host_name = "worker1.example.com"
  end

end

module Vagrant
  module Command
    module BigData
      class RunServer < Vagrant::Command::Base
        def execute
          server_command = "cd /vagrant && octo.py server #{@argv[0]}"
          with_target_vms(:server) do |vm|
            vm.channel.execute(server_command){|type, data|Object.const_get(type.to_s.upcase).write data}
          end
        end
      end
      class RunClient < Vagrant::Command::Base
        def execute
          client_command = "cd /vagrant && octo.py client 192.168.10.10 &"
          with_target_vms(:worker1) do |vm|
            vm.channel.execute(client_command){|type, data|Object.const_get(type.to_s.upcase).write data}
          end
        end
      end
    end
  end
end
Vagrant.commands.register(:client) { Vagrant::Command::BigData::RunClient }
Vagrant.commands.register(:run) { Vagrant::Command::BigData::RunServer }
