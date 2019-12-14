#!/bin/bash
#==========================================================
#title		:launch_vm.sh
#usage		:bash launch_vm.sh Android7 5555 headless
#author 	:Zhen Dong
#date		:Nov. 27, 2019
#==========================================================

VM=$1
ADB_PORT=$2
MODEL=$3

#set up vm
/root/3TDroid/scripts/setup_vm.sh $VM $ADB_PORT

#launch vm
vboxmanage startvm $VM --type $MODEL

#enter bash after launching vm
/bin/bash

