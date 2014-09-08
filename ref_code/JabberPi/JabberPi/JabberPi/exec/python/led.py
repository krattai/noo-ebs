#!/usr/bin/env python
# -*- coding: utf-8 -*-

import RPi.GPIO as GPIO
import time
import sys

#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv)

portNo = int(sys.argv[1])
value = int(sys.argv[2])
rPortNo = 0 

if portNo == 1 :
	rPortNo = 25
elif portNo == 2 :
	rPortNo = 24
elif portNo == 3 :
	rPortNo = 23
elif portNo == 4 :
	rPortNo = 22
else :
	rPortNo = 0

if rPortNo > 0:

	GPIO.setmode(GPIO.BCM)
	GPIO.setwarnings(False)
	GPIO.setup(rPortNo, GPIO.OUT)

	if value == 0 :
		GPIO.output(rPortNo, True)
	else :
		GPIO.output(rPortNo, False)

	print 'OK'
else :
	print 'Bad Port Number'
#	time.sleep(1)
