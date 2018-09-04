#! /bin/sh

sudo -s
apt -y update && apt -y upgrade
apt install apt-transport-https lsb-release ca-certificates wget git vim mysql-server curl -y


#Instalacija najnovijeg nginx-a
#__________________________________________

wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
echo "deb http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/debian/ stretch nginx" | sudo tee -a /etc/apt/sources.list
apt-get update; apt-get -y install nginx
systemctl start nginx.service

systemctl enable nginx.service

service nginx restart

#Instalacija PHP7.1 verzija
#----------------------------------------------

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt update
apt install php7.1-common  php7.1-readline php7.1-fpm php7.1-cli php7.1-gd php7.1-mysql php7.1-mcrypt php7.1-curl php7.1-mbstring php7.1-opcache php7.1-json -y


sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.1/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/7.1/fpm/php.ini
sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/7.1/fpm/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/7.1/fpm/php.ini

mv /etc/php/7.1/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf.org
sudo cp /vagrant/templates/www.conf /etc/php/7.1/fpm/pool.d/

systemctl restart php7.1-fpm
#--------------------------
rm /etc/nginx/conf.d/default.conf
cp /vagrant/templates/wordpress.conf /etc/nginx/conf.d/
service nginx restart

#---------------------------------------------------

systemctl restart nginx

# Konfiguracija MYSQL-a
#------------------------------------------

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

#------------------------------------------

cd /tmp

curl -O https://wordpress.org/latest.tar.gz

tar xzvf latest.tar.gz

mkdir -p /var/www/html/

touch /tmp/wordpress/.htaccess
chmod 660 /tmp/wordpress/.htaccess
mkdir /tmp/wordpress/wp-content/upgrade

cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php

mkdir -p /var/www/html

cp -a /tmp/wordpress/. /var/www/html

chown -R vagrant:www-data /var/www/html

chmod g+w /var/www/html/wp-content

chmod -R g+w /var/www/html/wp-content/themes
chmod -R g+w /var/www/html/wp-content/plugins



curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/html/wp-config.php
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/wordpressuser/g' /var/www/html/wp-config.php
sed -i 's/password_here/password/g' /var/www/html/wp-config.php

#sed -i 's/localhost/192.168.56.104/g' /var/www/html/wp-config.php
