sudo apt install w3m
sleep 5
clear

. /etc/os-release
a="$VERSION_ID"
echo
	if test $a = "16.04"
		then
			sudo echo '#VirtualBox' | sudo tee -a /etc/apt/sources.list
			sudo echo 'deb http://download.virtualbox.org/virtualbox/debian bionic contrib' | sudo tee -a /etc/apt/sources.list
				elif test $a = "18.04"
		then
			sudo echo '#VirtualBox' | sudo tee -a /etc/apt/sources.list
			sudo echo 'deb http://download.virtualbox.org/virtualbox/debian focal contrib' | sudo tee -a /etc/apt/sources.list 
				elif test $a = "20.04"
			
		then
	  			else echo "Mate nepodporovane Distro"
		exit
      
	  
	fi


# Install Apache
clear
echo ------ INSTALL APACHE ------
	sleep 5
		sudo apt install apache2
		echo
		echo
clear
ifconfig -all
sleep 5
echo test: Open your web browser and navigate to http://localhost/ or http://server-ip-address/.
sleep 10



# install MariaDB
clear
echo ------ INSTALL MariaDB ------
echo
sleep 5
sudo apt purge mysql*
sudo apt autoremove
sudo apt install mariadb-server mariadb-client
echo 
echo
#echo test MariaDB
#echo
#sudo service mysql status
#sleep 10
#clear

# Install PHP
clear
echo ------ INSTALL PHP ------

sleep 5
	sudo apt install php
clear
	php -v
		read -p 'Actual php Version (x.x): ' PHPVER
			sudo apt install libapache2-mod-php$PHPVER libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libapr1 php$PHPVER-common php$PHPVER-mysql php$PHPVER-soap php-pear
			sudo mkdir /var/www/
			sudo mkdir /var/www/html
				sudo echo '<?php' | sudo tee -a /var/www/html/testphp.php
				sudo echo 'phpinfo();' | sudo tee -a /var/www/html/testphp.php
				sudo echo '?>' | sudo tee -a /var/www/html/testphp.php
		sudo systemctl restart apache2.service
	echo Navigate to http://server-ip-address/testphp.php
sleep 10
clear


# sleep 10
# echo
# clear

echo ------- INSTALL WEBMIN -------

	sudo apt install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
		sudo echo '#WEBMIN' | sudo tee -a /etc/apt/sources.list
		sudo echo 'deb https://download.webmin.com/download/repository sarge contrib' | sudo tee -a /etc/apt/sources.list
			wget http://www.webmin.com/jcameron-key.asc
				sudo apt-key add jcameron-key.asc
				sudo apt install apt-transport-https
			sudo apt update
		sudo apt install webmin
		sleep 5
clear


echo ------ INSTALL VirtualBox ------

sleep 5
	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc
		sudo apt-key add oracle_vbox_2016.asc
		sudo apt update
			read -p 'Actual Virtualbox Version (x.x): ' VirtVER
		sudo apt install virtualbox-$VirtVER
		sudo /etc/init.d/virtualbox status
sleep 5
		sudo useradd -m vbox -G vboxusers
			echo -n "Enter your vbox user passwd [ENTER]: " ; sudo passwd vbox
		sudo usermod -a -G disk vbox
sleep 5
clear

echo ------ INSTALL VirtualBox Extension Pack ------

sudo echo 'VBOXWEB_USER=vbox' | sudo tee -a /etc/default/virtualbox
sudo /etc/init.d/vboxweb-service start
sleep 5
# Extension pack uninstall
sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"


# Extension pack install
echo
echo ------ INSTALL Extension pack ------
echo
t1="vboxmanage --version"
t2=$($t1 | cut -c 1-3) 
t3=$($t1 | cut -c 1-6)
t4=$($t1 | cut -c 15-20)
. /etc/os-release
a="$NAME"
Codename=$(lsb_release -c --short)


echo 'http://download.virtualbox.org/virtualbox/'$t3'/''Oracle_VM_VirtualBox_Extension_Pack-'$t3'.vbox-extpack'
wget 'http://download.virtualbox.org/virtualbox/'$t3'/''Oracle_VM_VirtualBox_Extension_Pack-'$t3'.vbox-extpack'
sudo VBoxManage extpack install 'Oracle_VM_VirtualBox_Extension_Pack-'$t3'.vbox-extpack'


echo ------ Install phpVirtualBox ------

  wget https://github.com/phpvirtualbox/phpvirtualbox/archive/develop.zip
		#unzip
		  unzip /var/www/develop.zip
		  sudo mv phpvirtualbox-develop  /var/www/html/phpvirtualbox

		#  configure virtualbox
	  
			sudo cp /var/www/html/phpvirtualbox/config.php-example /var/www/html/phpvirtualbox/config.php
			sudo nano /var/www/html/phpvirtualbox/config.php
			sudo echo 'VBOXWEB_USER=vbox' | sudo tee -a /etc/default/virtualbox
			sudo /etc/init.d/vboxweb-service start

clear


exit

