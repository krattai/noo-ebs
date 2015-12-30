#!/bin/bash

i="0"

while [ $i -lt 1 ]
do
hostn=$(cat /etc/hostname)
ext_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
# mosquitto_pub -d -t hello/world -m "$(date) : irot LdB, online. IP is $ext_ip" -h "uveais.ca"
mosquitto_pub -d -t aebl/alive -m "$(date) : $hostn device IP $ext_ip is online." -h "2604:8800:100:19a::2"
# i=$[$i+1]
sleep 300
done
