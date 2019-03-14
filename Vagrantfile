$script = <<-SCRIPT
apt update && apt upgrade -y && apt install net-tools vim -y
SCRIPT

$scriptwp = <<-SCRIPT
apt update && apt upgrade -y && apt install net-tools apache2 vim php libapache2-mod-php php-mcrypt php-cli curl php-mysql -y
SCRIPT

$scriptwpX = <<-SCRIPT
apt update && apt upgrade -y && apt install net-tools nginx vim php php-fpm php-mcrypt php-cli curl php-mysql -y
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
  app.vm.box = "debian/stretch64"
  app.vm.hostname = 'app'
  app.vm.network "private_network", ip: "192.168.56.101"

  app.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "app"]
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.provision "shell", inline: $script
    end
 end

 config.vm.define "cache1web" do |cache1web|
  cache1web.vm.box = "debian/stretch64"
  cache1web.vm.hostname = 'cache1web'
  cache1web.vm.network "private_network", ip: "192.168.56.107"

  cache1web.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "cache1web"]
    config.vm.network "forwarded_port", guest: 80, host: 8280
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
    config.vm.network "forwarded_port", guest: 80, host: 8180
    config.vm.provision "shell", inline: $scriptwp
    end
 end

 config.vm.define "cache2web" do |cache2web|
  cache2web.vm.box = "debian/stretch64"
  cache2web.vm.hostname = 'cache2web'
  cache2web.vm.network "private_network", ip: "192.168.56.108"

  cache2web.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "cache2web"]
    config.vm.network "forwarded_port", guest: 80, host: 8280
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
    config.vm.network "forwarded_port", guest: 80, host: 8280
    config.vm.provision "shell", inline: $scriptwpX
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
    config.vm.network "forwarded_port", guest: 80, host: 8380
    config.vm.provision "shell", inline: $script
    end
  end

 config.vm.define "backupdbweb" do |backupdbweb|
  backupdbweb.vm.box = "debian/stretch64"
  backupdbweb.vm.hostname = 'backupdbweb'
  backupdbweb.vm.network "private_network", ip: "192.168.56.105"

  backupdbweb.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--name", "backupdbweb"]
    config.vm.network "forwarded_port", guest: 80, host: 8480
    config.vm.provision "shell", inline: $script
    end
  end
end
