#!/usr/bin/env python
# coding: utf-8
# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4 syn=python

'''
This little bit of micropython on an ESP8266 will unpack the I2C GPS fix into a dict()
'''

from machine import Pin, I2C
try:
    from struct import unpack
except ImportError:
    from ustruct import unpack

def decode_gps(buf):
    v = unpack('<BBHBBBBBlllL', buf)
    decoded = {
        'status': v[1],
        'time': list(v[2:8]), # needs to be mutable, for year fixups
        'lat': v[8]/1e7,
        'lon': v[9]/1e7,
        'alt': v[10]/1e2,
        'speed': v[11]/1943.84, # kt*1000 -> m/s
    }

    # Depending on the receiver, 4 digit years from ZDA might be available.
    # This little dance tries to get the year into some reasonable value.
    if decoded['time'][0] < 1900:
        if decoded['time'][0] >= 93:
            # GPS Initial Operational Capability was in 1993/12/08
            decoded['time'][0] += 1900
        else:
            decoded['time'][0] += 2000
    return decoded


def readgps(bus, gps):
    msgsize = bus.readfrom(gps, 1)[0]
    buf = bytearray(msgsize)
    bus.readfrom_into(gps, buf)
    print(decode_gps(buf))


gps = ord('X') # X marks the spot
bus = I2C(sda=Pin(4), scl=Pin(5), freq=100000);
assert gps in bus.scan()

readgps(bus, gps)
