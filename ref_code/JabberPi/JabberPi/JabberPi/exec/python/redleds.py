#!/usr/bin/env python

import RPi.GPIO as GPIO
import sys
#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv)

value = int(sys.argv[1])

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(4, GPIO.OUT)
GPIO.setup(18, GPIO.OUT)

if value == 0 :
	GPIO.output(4, True)
	GPIO.output(18, True)
else :
	GPIO.output(4, False)
	GPIO.output(18, False)
print 'OK'
