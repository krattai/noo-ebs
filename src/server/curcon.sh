#!/bin/bash
# Currency converter
#
# Copyright (C) 2015 Uvea I. S., Kevin Rattai
#
# noo-ebs may not be the right place for this, but here for now
#
# Basic premise"
# + able to take numberical value, and conversion vector
# + return value in desired currency
# i.e. 5 hrs CDN (5 hours to canadian): return 75
# able to grab current values from yahoo
# assumed that hour equals (arbitrary) wage of $15/hr
#
# $HOME/tmpdir_maintenance/mod_Twitter/./tcli.sh -c statuses_update -s "Today's bitcoin rate CAD\$517.2529 #PSA #am2p"
#
# or
#
# mosquitto_pub -d -t aebl/social -m "Today's bitcoin rate is CAD\\\$576.5844 and US$ rate is CAD\\\$1.3769 #PSA #am2p" -h "uveais.ca"
#
# wget -O btc.txt "http://finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=BTCCAD=X"

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
