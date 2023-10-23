# add Vbox HDD
clear
echo ------ Add Virtualbox HDD ------

sleep 5
	lsblk
		read -p 'Add HDD (sdx): ' HDD1
		read -p 'Add HDD (sdx): ' HDD2
			VBoxManage internalcommands createrawvmdk -filename "/home/vbox/virtual_HDD/HDD1.vmdk"  --rawdisk /dev/$HDD1
			VBoxManage internalcommands createrawvmdk -filename "/home/vbox/virtual_HDD/HDD2.vmdk"  --rawdisk /dev/$HDD2
exit

