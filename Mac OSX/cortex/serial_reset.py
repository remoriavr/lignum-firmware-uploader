#! /usr/bin/python
import sys
import serial
ser = serial.Serial()
ser.baudrate = 1200
ser.port = sys.argv[1]
ser.open()
ser.close()
