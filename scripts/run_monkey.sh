#!/bin/bash
#==========================================================================
#title		:run_monkey.sh
#usage		:bash run_monkey.sh Android7 5555 headless delay event_num
#author 	:Zhen Dong
#date		:Nov. 27, 2019
#==========================================================================

VM=$1
ADB_PORT=$2
MODEL=$3
DELAY=$4
EVENT_NUM=$5
DEVICE="127.0.0.1:"$ADB_PORT
APK=/root/aut.apk
APP_PKG=`aapt dump badging $APK | grep package | awk '{print $2}' | sed s/name=//g | sed s/\'//g`

function connect_adb {
    while true; do
        echo 'connecting adb ...'
        adb disconnect $DEVICE 
        adb connect $DEVICE 

        ! timeout 2 adb -s $DEVICE wait-for-device shell exit 0 > /dev/null 2>&1 || break
    done 
    
    adb -s $DEVICE wait-for-device
}


#set up vm
/root/3TDroid/scripts/setup_vm.sh $VM $ADB_PORT

#launch vm
vboxmanage startvm $VM --type $MODEL


#connect vm via adb
connect_adb
echo "waiting for device be ready..."
sleep 8 

adb -s $DEVICE devices

#Give all permission when installing app under test
echo "install app under test"
adb -s $DEVICE install -g $APK

#testing app under test with monkey
echo "start monkey ..."
adb -s $DEVICE shell monkey -p $APP_PKG --throttle $DELAY -v $EVENT_NUM

#shut down vm after completing testing 
echo "testing done, shut down vm ..."
vboxmanage controlvm $VM poweroff


