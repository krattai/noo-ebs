#!/usr/bin/env python

#
# Copyright (C) 2016 Uvea I. S., Kevin Rattai
#
# This script monitors noo-ebs broker and acts on messages
# It is an initial and temporary bridge to handle messages
#
# Want to be able to handle files in order to send out PSA
#  messages on consideration and subscription

import paho.mqtt.client as mqtt

# Unknown license, code found here:  http://stackoverflow.com/questions/31775450/publish-and-subscribe-with-paho-mqtt-client

# reference to MQTT python found here: http://mosquitto.org/documentation/python/

# requires:  sudo pip install paho-mqtt
# pip requires: sudo apt-get install python-pip

# Should include functionality to gzip and rotate of logs created by mon_mqtt to
# prevent filling all disk space
# 

message = 'ON'
def on_connect(mosq, obj, rc):
#    mqttc.subscribe("aebl/world", 0)
    mqttc.subscribe("nooebs/#", 0)
    print("rc: " + str(rc))

def on_message(mosq, obj, msg):
    global message
    print(msg.topic + " " + str(msg.qos) + " " + str(msg.payload))
    message = msg.payload
#   Keep tabs on message requests from clients and act on them
#    mqttc.publish("aebl/world",msg.payload);
#    mqttc.publish("aebl/world","uvea/alive - ACK");
#    if 'ACK' in message:
#        mqttc.publish("aebl/alive/chan","NAK");
    if 'played' in message:
#        os.system("echo " + str(message) >> playlog.txt)
#
#       this parses line:
#         echo idetkev played /home/pi/ad/15secPonyOUT.mp4 | grep -o -E 'ad/[^ ]+' | sed 's/.*ad/\//'
#       result is:
#         //15secPonyOUT.mp4

        myFile = open('$HOME/playlog.txt', 'a') # or 'a' to add text instead of truncate
        myFile.write(message + '\n')
        myFile.close()
    if 'IPv6' in message:
        myFile = open('$HOME/ipv6log.txt', 'a') # or 'a' to add text instead of truncate
        myFile.write(message + '\n')
        myFile.close()
    if 'reboot' in message:
        myFile = open('$HOME/actionlog.txt', 'a') # or 'a' to add text instead of truncate
        myFile.write(message + '\n')
        myFile.close()
#        mqttc.publish("test/output","NAK");
#    mqttcb.publish("test/output",msg.payload);


def on_publish(mosq, obj, mid):
    print("mid: " + str(mid))

def on_subscribe(mosq, obj, mid, granted_qos):
    print("Subscribed: " + str(mid) + " " + str(granted_qos))

def on_log(mosq, obj, level, string):
    print(string)

mqttc = mqtt.Client()
# Assign event callbacks
mqttc.on_message = on_message
mqttc.on_connect = on_connect
mqttc.on_publish = on_publish
mqttc.on_subscribe = on_subscribe

# Connect
# mqttc.connect("localhost", 1883,60)

# eventually, messages should be managed on an aebl broker
# mqttc.connect("aebl.oss", 1883,60)
mqttc.connect("uveais.ca", 1883,60)
# mqttc.connect("2001:5c0:1100:dd00:ba27:ebff:fe2c:41d7", 1883,60)
#
# New small-srvr V6
# mqttc.connect("2604:8800:162:dead:216:17ff:feb8:c36", 1883,60)


# mosquitto_sub -h 2001:5c0:1100:dd00:ba27:ebff:fe2c:41d7 -t "hello/+" -t "aebl/+" -t "ihdn/+" -t "uvea/+"

# Continue the network loop
mqttc.loop_forever()
