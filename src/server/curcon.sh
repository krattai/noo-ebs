#!/bin/bash
# Currency converter
#
# Copyright (C) 2015 Uvea I. S., Kevin Rattai
#
# noo-ebs may not be the right place for this, but here for now
#

# patch system now seeking network info in /run/shm
TEMP_DIR="~/tempdir"

sudo apt-get update

sudo apt-get -y install openssh-server samba samba-common-bin libnss-mdns lsof gogoc

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
scripts/./pub.sh
