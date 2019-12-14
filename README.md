# docker\-android\-vm #
An Android virtual machine runs in a docker container and supports saving/restoring a state during testing. This is a general framework that powers existing Android testing techniques with time-travel testing. 

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

docker build -t zhendong/3tdroid .


docker run -it --rm --privileged -e DISPLAY=$DISPLAY --net=host -v $HOME/.Xauthority:/root/.Xauthority:rw -v /dev:/dev -v /home/dz/Android_7_Exper/batch2/Fox_News.apk:/root/aut.apk:ro zhendong/3tdroid  /root/3TDroid/scripts/run_monkey.sh Android_7 6666 gui 100 50

