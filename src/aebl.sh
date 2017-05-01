#!/bin/bash
# installs noo-ebs
#
# Copyright (C) 2015 - 2017 Uvea I. S., Kevin Rattai
#
# Obviously, in this first instance of noo-ebs for test and
# production, this script installs MQTT
#
# The goal is to eventually move to, or at least add as a
# supplemental, a peer to peer message queue system
#

# patch system now seeking network info in /run/shm
TEMP_DIR="~/tempdir"

sudo apt-get update

# gogoc no longer available from provider and openssh not needed until vpn files installed
# sudo apt-get -y install openssh-server samba samba-common-bin libnss-mdns lsof gogoc
sudo apt-get -y install samba samba-common-bin libnss-mdns lsof

cd ~
mkdir ${TEMP_DIR}
mkdir scripts

# get noo-ebs installer and run it
wget -N -nd -w 3 -P ${TEMP_DIR} --limit-rate=50k "https://raw.githubusercontent.com/krattai/noo-ebs/master/src/install.sh"
chmod 777 ${TEMP_DIR}/install.sh
${TEMP_DIR}/./install.sh
rm ${TEMP_DIR}/install.sh

# get pub.sh as generic, initial message publisher
wget -N -nd -w 3 -P ${TEMP_DIR} --limit-rate=50k "https://raw.githubusercontent.com/krattai/noo-ebs/master/ref_code/mqtt/pub.sh"
mv ${TEMP_DIR}/pub.sh $HOME/scripts
chmod 777 $HOME/scripts/pub.sh

cd ~
scripts/./pub.sh &

exit
