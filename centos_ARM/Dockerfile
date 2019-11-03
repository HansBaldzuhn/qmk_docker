FROM centos:7.6.1810

WORKDIR qmk

RUN yum install -y epel-release && sed -i "s/mirrorlist=https/mirrorlist=http/" /etc/yum.repos.d/epel.repo
RUN yum -y groupinstall "Development Tools"

RUN yum install -y  \
    wget \
    glibc-devel.x86_64 \
    wget \
    git \
    tar \
    cmake \
    python3 \
    python3-pip

RUN yum install -y \
	build-essential \
	dnf \
	gcc \
	unzip \
	wget \
	zip\
	gcc-avr\
	binutils-avr\
	avr-libc\
	dfu-programmer\
	dfu-util\
	gcc-arm-none-eabi\
	binutils-arm-none-eabi\
	libnewlib-arm-none-eabi\
	git

RUN yum install -y \
	gcc-arm* \
	avr-* \
	libusb-devel \
	usbutils \
	gtk2 \
	libSM
	
RUN yum install -y dnf python3-pip

RUN dnf install -y gcc-c++-arm-linux-gnu


RUN wget https://www.pjrc.com/teensy/49-teensy.rules && \
	cp 49-teensy.rules /etc/udev/rules.d/

RUN wget https://www.pjrc.com/teensy/teensy_linux64.tar.gz && \
	mkdir teensy_linux64 && cd teensy_linux64 &&\
	tar -xvf ../teensy_linux64.tar.gz && \
	cd - && rm teensy_linux64.tar.gz

RUN git clone --recurse-submodules https://github.com/qmk/qmk_firmware.git

