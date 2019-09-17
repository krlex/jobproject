Vagrant.configure("2") do |config|
 config.vm.define "app" do |app|
  app.vm.box = "debian/buster64"
  app.vm.hostname = 'app'
  app.vm.network "private_network", ip: "192.168.56.101"

  app.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "app"]
    end
 end

 config.vm.define "srv1web" do |srv1web|
  srv1web.vm.box = "debian/buster64"
  srv1web.vm.hostname = 'srv1web'
  srv1web.vm.network "private_network", ip: "192.168.56.102"

  srv1web.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "srv1web"]
    end
 end

 config.vm.define "srv2web" do |srv2web|
  srv2web.vm.box = "debian/buster64"
  srv2web.vm.hostname = 'srv2web'
  srv2web.vm.network "private_network", ip: "192.168.56.103"


  srv2web.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "srv2web"]
    end
 end

 config.vm.define "dbweb" do |dbweb|
  dbweb.vm.box = "debian/buster64"
  dbweb.vm.hostname = 'dbweb'
  dbweb.vm.network "private_network", ip: "192.168.56.104"

  dbweb.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "dbweb"]
    end
  end

 config.vm.define "backupdbweb" do |backupdbweb|
  backupdbweb.vm.box = "debian/buster64"
  backupdbweb.vm.hostname = 'backupdbweb'
  backupdbweb.vm.network "private_network", ip: "192.168.56.105"

  backupdbweb.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "backupdbweb"]
    end
  end
end
