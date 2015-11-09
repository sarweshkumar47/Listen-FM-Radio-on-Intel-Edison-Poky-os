#!/bin/bash
# First download git
echo "-----------------------------------------------------------------"
echo "Configuration started ......"
echo "Please run this script only once, after that delete it"
echo "Watch the progress bar......"
echo "src all http://iotdk.intel.com/repos/1.1/iotdk/all" > /etc/opkg/base-feeds.conf
echo "src x86 http://iotdk.intel.com/repos/1.1/iotdk/x86" >> /etc/opkg/base-feeds.conf
echo "src i586 http://iotdk.intel.com/repos/1.1/iotdk/i586" >> /etc/opkg/base-feeds.conf
echo "Progress |####                                                  |"
sleep 1
#Update opkg list
opkg update
opkg install git
#Libusb config
opkg install --force-downgrade libusb-1.0-dev
echo "Progress |########                                              |"                     
sleep 2
#Source compilation
mkdir /rtlsdr
cd /rtlsdr
git clone git://git.osmocom.org/rtl-sdr.git
echo "Progress |##############                                        |"                   
sleep 2
cd rtl-sdr
autoreconf -i
echo "Progress |###################                                   |"
sleep 2
./configure
make
echo "Progress |#######################################               |"                   
sleep 2
make install
echo "Progress |##############################################        |"
sleep 2
make install-udev-rules
echo "/usr/local/lib" > /etc/ld.so.conf
ldconfig
echo "pcm.!default sysdefault:Headset" > ~/.asoundrc
echo "Progress |######################################################|"                   
sleep 2
echo "done."
echo "Complete."
