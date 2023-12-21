#!/bin/bash

apt update -y
apt install apache2 -y
apt install zip -y
apt install mariadb-server -y
apt install php -y
apt install php-mysql -y
apt install wget -y

cd /tmp
wget https://wordpress.org/latest.zip

echo "Veuillize saisir le nom de votre base de donnée"
read bsd
echo "Veuilliez saisir votre utilisateur"
read usr
echo "Veuilliez saisir votre mot de passe"
read mdp
mysql --user=root --password=**** -e "CREATE DATABASE $bsd; CREATE USER '$usr'@'localhost' IDENTIFIED BY '$mdp'; GRANT ALL PRIVILEGES ON $bsd.* TO $usr@localhost; FLUSH PRIVILEGES;"
rm /var/www/html/index.html
unzip latest.zip -d /var/www/html
cd /var/www/html
mv wordpress/* /var/www/html/
rm wordpress/ -Rf
chown -R www-data:www-data /var/www/html/
systemctl restart apache2








