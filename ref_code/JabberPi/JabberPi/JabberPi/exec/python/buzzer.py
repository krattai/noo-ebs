#!/usr/bin/env python

import RPi.GPIO as GPIO
import time
#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv)

#value = int(sys.argv[1])

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(17, GPIO.OUT)
#GPIO.setup(21, GPIO.OUT)

#if value == 1 :
#	GPIO.setup(4, GPIO.OUT)
GPIO.output(17, False)
time.sleep(1)
#	GPIO.setup(18, GPIO.OUT)
GPIO.output(17, True)
#else :
 #       GPIO.setup(4, GPIO.OUT)
#	GPIO.output(4, False)
#	GPIO.setup(18, GPIO.OUT)
#	GPIO.output(18, True)

#else :
print 'OK'
#	time.sleep(1)
