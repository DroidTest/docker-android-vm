# docker\-android\-vm #
An Android virtual machine (Android7.2-x86) runs in a docker container and supports saving/restoring a state during testing. This is a general framework that powers existing Android testing techniques with time-travel testing. 

## Publication ##
```
@InProceedings{zhendong:icse:2020,
author = {Zhen Dong, Marcel B\"ohme, Lucia Cojocaru, Abhik Roychoudhury},
titile = {Time-travel Testing of Android Apps},
booktitle = {Proceedings of the 42nd International Conference on Software Engineering},
series = {ICSE '20},
year = {2020}
}

```
## Instructions ##
The framework runs on Ubuntu 16.04 with docker installed.

### build a docker image ###

* git clone https://github.com/DroidTest/docker-android-vm.git
* cd docker-android-vm/docker 
* docker build -t droidtest/android7-vm . 

### Usage ###
 * launch a vm with GUI (default adb port: 6666) 
 
```
docker run -it --privileged -e DISPLAY=$DISPLAY --net=host -v $HOME/.Xauthority:/root/.Xauthority:rw -v /dev:/dev droidtest/android7-vm  /root/docker-android-vm/scripts/launch_vm.sh Android_7 6666 gui
```

* launch a vm with headless 
```
docker run -it --privileged -v /dev:/dev droidtest/android7-vm  /root/docker-android-vm/scripts/launch_vm.sh Android_7 6666 headless
```


