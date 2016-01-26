#!/usr/bin/env python

import paho.mqtt.client as mqtt

# Unknown license, code found here:  http://stackoverflow.com/questions/31775450/publish-and-subscribe-with-paho-mqtt-client

# reference to MQTT python found here: http://mosquitto.org/documentation/python/

# requires:  pip install paho-mqtt
# pip requires: sudo apt-get install python-pip

message = 'ON'
def on_connect(mosq, obj, rc):
    mqttc.subscribe("aebl", 0)
    print("rc: " + str(rc))

def on_message(mosq, obj, msg):
    global message
    print(msg.topic + " " + str(msg.qos) + " " + str(msg.payload))
    message = msg.payload
    mqttc.publish("uvea",msg.payload);

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
mqttc.connect("2001:5c0:1100:dd00:240:63ff:fefd:d3f1", 1883,60)

# Continue the network loop
mqttc.loop_forever()
