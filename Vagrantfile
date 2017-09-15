Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vbox|
    vbox.name = "phx"
  end
  config.vm.box = "howyi/phx"
  config.vm.network "private_network", ip: "192.168.33.117"
  config.ssh.insert_key = false
end
