# Extension pack uninstall
sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"

# Extension pack install
t1="vboxmanage --version"
t2=$($t1 | cut -c 1-3) 
t3=$($t1 | cut -c 1-5)
t4=$($t1 | cut -c 15-20)
. /etc/os-release
a="$NAME"
Codename=$(lsb_release -c --short)


echo 'http://download.virtualbox.org/virtualbox/'$t3'/''Oracle_VM_VirtualBox_Extension_Pack-'$t3'.vbox-extpack'
wget 'http://download.virtualbox.org/virtualbox/'$t3'/''Oracle_VM_VirtualBox_Extension_Pack-'$t3'.vbox-extpack'
sudo VBoxManage extpack install 'Oracle_VM_VirtualBox_Extension_Pack-'$t3'.vbox-extpack'
