# -*- mode: ruby -*-
# vim: set ft=ruby :

#ENV['VAGRANT_SERVER_URL'] = 'https://vagrant.elab.pro'

MACHINES = {
  :vmgrub => {
				:box_name => "centos-1804",
				:vm_name => "vmgrub",
        		:box_version => "1804",
				:net => [
							["192.168.8.3", 2, "255.255.255.0", "mynet1"],
						],
			}

		   }

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|
					config.vm.synced_folder "sync/", "/vagrant", type: "rsync", create: "true"
					config.vm.define boxname do |box|

												box.vm.box = boxconfig[:box_name]
												box.vm.host_name = boxname.to_s

					boxconfig[:net].each do |ipconf|
        			box.vm.network("private_network", ip: ipconf[0], adapter: ipconf[1], netmask: ipconf[2], virtualbox__intnet: ipconf[3])

										end
		  

					box.vm.provider :virtualbox do |vb|
							vb.customize ["modifyvm", :id, "--memory", "1024"]
							vb.name = boxconfig[:vm_name]
         
												end
          

						box.vm.provision "shell", path: "update.sh", name: "update"
						box.vm.provision "shell", path: "rename_vg.sh", name: "rename_vg"
			end
      end

end