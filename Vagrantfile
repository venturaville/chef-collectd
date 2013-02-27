require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-10.18.2.box"
  config.vm.customize ["modifyvm", :id, "--vram", 64]
  config.vm.boot_mode = :headless # or :gui
  config.vm.customize ["modifyvm", :id, "--memory", 512]
  config.vm.customize ["modifyvm", :id, "--cpus", 1]
  config.vm.network :bridged
  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.define :collectd1 do |c|
    c.vm.network :hostonly, "11.11.11.11"
    c.vm.host_name = "collectd1"
    c.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        "recipe[collectd::test]",
        "recipe[collectd::client]",
        "recipe[minitest-handler]"
      ]
    end
  end
end
