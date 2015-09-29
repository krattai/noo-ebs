#!/bin/bash
# installs noo-ebs
#
# Copyright (C) 2015 Uvea I. S., Kevin Rattai
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

sudo apt-get -y install openssh-server samba samba-common-bin libnss-mdns lsof gogoc

cd ~
mkdir ${TEMP_DIR}

# get noo-ebs installer and run it
wget -N -nd -w 3 -P ${TEMP_DIR} --limit-rate=50k "https://raw.githubusercontent.com/krattai/noo-ebs/master/src/install.sh"
chmod 777 ${TEMP_DIR}/install.sh
${TEMP_DIR}/./install.sh
rm ${TEMP_DIR}/install.sh
