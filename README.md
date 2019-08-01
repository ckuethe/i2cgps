# I2CGPS

From time to time you want to attach a GPS to a microcontroller and you're already using all the serial ports. Luckily we have another bus: I2C. You could call it a kind of a controller-area-network, given that there are master and slave devices, each of which has a unique address.

Unfortunately there are very few commercial [I2C GPS](https://www.sparkfun.com/products/14414) receivers and they just do NMEA over I2C. There are [other projects](http://www.technoblogy.com/show?1LJI) that do something similar, but with a higher part count. 