FROM zhendong2050/android-x86-7.1
MAINTAINER zhendong@gmail.com

WORKDIR /root
ENV DEBIAN_FRONTEND noninteractive

RUN  apt-get update && apt-get install -y linux-headers-$(uname -r) virtualbox-dkms virtualbox virtualbox-qt

#super important: setting enviroment variables
ENV VBOX_INSTALL_PATH=/usr/lib/virtualbox
ENV VBOX_SDK_PATH=/usr/lib/virtualbox/sdk
ENV PYTHONPATH=/usr/lib/virtualbox/sdk/bindings/xpcom/python


# install virtualbox sdk
RUN cd vbox_sdk/installer && python vboxapisetup.py install

# clone the project
RUN git clone https://github.com/zhendong2050/3TDroid.git


