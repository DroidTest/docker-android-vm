#!/bin/bash
#==========================================================================
#title          :setup_vm.sh
#usage          :./setup_vm.sh Android7 5555 
#author         :Zhen Dong
#date           :Nov. 27, 2019
#==========================================================================

#check if vboxdrv is loaded
/root/3TDroid/scripts/check_vboxdrv.sh


MACHINE_NAME=$1
ADB_PORT=$2


#create a vm with name "Android6"
vboxmanage createvm --name $MACHINE_NAME --ostype Linux26_64 --register

#setting memory
vboxmanage modifyvm $MACHINE_NAME --memory 4096

#setting network model
vboxmanage modifyvm $MACHINE_NAME --nic1 nat

#creating a storage controller
vboxmanage storagectl $MACHINE_NAME --name IDE --add ide


DISK_PATH=/root/AndroidOS/Android7.1
ORIGINAL_DISK=$DISK_PATH/Android7.1_base_disk.vmdk
NEW_DISK=$DISK_PATH/$MACHINE_NAME"_disk.vmdk"


cp $ORIGINAL_DISK $NEW_DISK
vboxmanage internalcommands sethduuid $NEW_DISK

vboxmanage storageattach $MACHINE_NAME --storagectl IDE --port 0 --device 0 --type hdd --medium $NEW_DISK

#forwarding adb port(5555)to localhost:6000
vboxmanage modifyvm $MACHINE_NAME --natpf1 "adb,tcp,127.0.0.1,"$ADB_PORT",,5555"




