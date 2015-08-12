#!/bin/bash

i="0"

while [ $i -lt 9999 ]
do
mosquitto_pub -d -t hello/world -m "$(date) : irot LdB, online." -h "uveais.ca"
i=$[$i+1]
sleep 300
done

