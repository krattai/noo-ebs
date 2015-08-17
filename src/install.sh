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

sudo apt-get -y install mosquitto python-mosquitto mosquitto-client dnsutils
