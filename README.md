# I2CGPS

From time to time you want to attach a GPS to a microcontroller and
you're already using all the serial ports. Luckily we have another bus:
I2C. You could call it a kind of a controller-area-network, given that
there are master and slave devices, each of which has a unique address.

Unfortunately there are very few commercial
[I2C GPS](https://www.sparkfun.com/products/14414) receivers and they
just do NMEA over I2C. There are
[other projects](http://www.technoblogy.com/show?1LJI) that do something similar, but with a higher part count. 

This particular implementation rather wastefully uses an ATmega, eg. an
Arduino Nano.

### TODO

* port this to attiny85, eg. digispark


### Other Links

* https://playground.arduino.cc/Code/USIi2c/
* https://github.com/rambo/TinyWire/tree/master/TinyWireS
* https://github.com/lucullusTheOnly/TinyWire
* https://github.com/adafruit/TinyWireM
* https://github.com/harbaum/I2C-Tiny-USB/tree/master/digispark
* https://digistump.com/board/index.php?topic=2831.0
* https://digistump.com/board/index.php?topic=1147.0
* https://digistump.com/wiki/digispark/tutorials/lcd
