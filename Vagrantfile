Vagrant.configure("2") do |config|
 config.vm.define "APU" do |app|
  app.vm.box = "krlex/freebsd-12.1.2-cbsd"
  app.vm.hostname = 'app'
  app.vm.network "private_network", ip: "192.168.56.101"

  app.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1048]
    v.customize ["modifyvm", :id, "--name", "app"]
    end
 end

 config.vm.define "host01" do |host01|
  host01.vm.box = "krlex/freebsd-12.1.2-cbsd"
  host01.vm.hostname = 'host01'
  host01.vm.network "private_network", ip: "192.168.56.102"

  host01.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1048]
    v.customize ["modifyvm", :id, "--name", "host01"]
    end
 end

 config.vm.define "host02" do |host02|
  host02.vm.box = "krlex/freebsd-12.1.2-cbsd"
  host02.vm.hostname = 'host02'
  host02.vm.network "private_network", ip: "192.168.56.103"


  host02.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1048]
    v.customize ["modifyvm", :id, "--name", "host02"]
    end
 end

 config.vm.define "dbmaster" do |dbmaster|
  dbmaster.vm.box = "krlex/freebsd-12.1.2-cbsd"
  dbmaster.vm.hostname = 'dbmaster'
  dbmaster.vm.network "private_network", ip: "192.168.56.104"

  dbmaster.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "dbmaster"]
    end
  end

 config.vm.define "dbslave" do |dbslave|
  dbslave.vm.box = "krlex/freebsd-12.1.2-cbsd"
  dbslave.vm.hostname = 'dbslave'
  dbslave.vm.network "private_network", ip: "192.168.56.105"

  dbslave.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "dbslave"]
    end
  end
end
