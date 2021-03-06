#!/bin/bash
# Element14 - SuddenImpact design challenge
# http://www.element14.com/community/community/design-challenges/sudden-impact
#
# This file is part of submission made for Modular&EasyConfigure project (tomaja).
#
# v010 - January 11th 2015.
#      Initial version. Subscribe to MQTT broker and act upon messages received.
#
#      June 10, 2017
#      Should have a list of brokers that would be working using some form of p2p message system
#

# mosquitto_sub -h 2001:5c0:1100:dd00:240:63ff:fefd:d3f1 -t "hello/+" -t "aebl/+" -t "ihdn/+" -t "uvea/+" |
# added a carriage return to eol of line above, otherwise it believed nl was part of comment

# using new bjour server as MQTT broker for now
mosquitto_sub -h 24.76.85.57 -t "hello/+" -t "aebl/+" -t "nooebs/+" -t "uvea/+" |
while IFS= read -r line
    do
          if [[ $line = "sixxs alive" ]]; then
              echo "$(date +"%T") - sixxs ACK"
              echo " "
          fi
          if [[ $line == *"ihdnsrvr IPv6"* ]]; then
              echo "$(date +"%T") - ihdnsrvr ACK"
              echo "$line"
              echo " "
          fi
          if [[ $line == *"played"* ]]; then
              echo "$(date +"%T") - play log"
              echo "$line"
              echo " "
          fi

done

exit 0
