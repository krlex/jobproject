Vagrant.configure("2") do |config|
 config.vm.define "web" do |web|
  web.vm.box = "debian/stretch64"
  web.vm.hostname = 'web'
  web.vm.network "private_network", ip: "192.168.56.101"

  web.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "web"]
    end
 end

 config.vm.define "srv1web" do |srv1web|
  srv1web.vm.box = "debian/stretch64"
  srv1web.vm.hostname = 'srv1web'
  srv1web.vm.network "private_network", ip: "192.168.56.102"

  srv1web.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "srv1web"]
    end
 end

 config.vm.define "srv2web" do |srv2web|
  srv2web.vm.box = "debian/stretch64"
  srv2web.vm.hostname = 'srv2web'
  srv2web.vm.network "private_network", ip: "192.168.56.103"


  srv2web.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "srv2web"]
    end
 end

 config.vm.define "dbweb" do |dbweb|
  dbweb.vm.box = "debian/stretch64"
  dbweb.vm.hostname = 'dbweb'
  dbweb.vm.network "private_network", ip: "192.168.56.104"

  dbweb.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "dbweb"]
    end
  end
end
