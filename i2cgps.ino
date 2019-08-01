/*
 * Yet Another I2C GPS firmware.
 * 
 * Because we have a whole microcontroller with ram 'n' stuff, it is possible
 * to parse the data on the AVR, and just send back a struct over i2c
 *
 * On the Wemos D1 Mini/Micropython end:
 *    SCL = D1 / GPIO5 / Pin(5) / phy_pin(20)
 *    SDA = D2 / GPIO4 / Pin(4) / phy_pin(14)
 * 
 * On the OSEPP Pro Mini, there are two extra holes for the I2C port. A4 (SDA)
 * is closer to the AVR, and A5 (SCL) A5 is closer to the FTDI header. Arduino
 * calls those pins 27 and 28 and the Wire library just assumes it can use them.
 *
 */

#include <Wire.h>
#include <WireData.h>

// #define VERBOSE  // Uncomment this to print stuff to the UART
#ifdef USE_NEO_SWSERIAL
#include <NeoSWSerial.h>
#define DEBUG_PORT Serial
#define GPS_PORT_NAME "NeoSWSerial(10,19)"
NeoSWSerial gpsPort(10, 19);  // RX=10, TX=19 which is not connected
#endif

#include <GPSport.h>
#include <NMEAGPS.h>

const int i2c_addr = 0x58; // Because 'X' marks the spot.

typedef struct fix {
  uint8_t fixlen; // first byte, so you can do a 1 byte i2c read to know the size of struct to receive
  uint8_t status; // whatever NeoGPS says our fix status is
  uint16_t year;
  uint8_t month, day, hour, minute, second;
  int32_t lat, lon;
  int32_t alt;
  uint32_t speed; // milli-knots.
} Fix_t;

static NMEAGPS  gps;
static gps_fix  fix;
static Fix_t i2c_fix;

void setup() {
#ifdef VERBOSE
  Serial.begin(57600);
#endif // VERBOSE
  gpsPort.begin(9600);
  i2c_fix.fixlen = sizeof(i2c_fix);
  Wire.begin(i2c_addr);
  Wire.onRequest(i2c_position_request);
  pinMode(LED_BUILTIN, OUTPUT);
}

unsigned long last_t = 0;
void loop() {
  while (gps.available( gpsPort )) {
    fix = gps.read();
    digitalWrite(LED_BUILTIN, digitalRead(LED_BUILTIN)^1);

#ifdef VERBOSE
    Serial.print("Status: "); Serial.println(fix.status);
    Serial.print("Latitude : "); Serial.println(fix.latitude(), 7);
    Serial.print("Longitude: "); Serial.println(fix.longitude(), 7);
    Serial.print("Altitude: "); Serial.println(fix.altitude());
    Serial.print("Speed: "); Serial.println(fix.speed_mph());
    // Serial.print("Sats: "); Serial.println(gps.sat_count);
    Serial.print("Time:"); Serial.println((String)" " + (2000+fix.dateTime.year) + "/" + fix.dateTime.month + "/" + fix.dateTime.day + " " + fix.dateTime.hours + ":" + fix.dateTime.minutes + ":" + fix.dateTime.seconds);
    Serial.println("");
#endif // VERBOSE

  }
}

void nmea2struct() {
  i2c_fix.status = fix.status;
  i2c_fix.lat = fix.latitudeL();
  i2c_fix.lon = fix.longitudeL();
  i2c_fix.alt = fix.altitude_cm();
  i2c_fix.speed = fix.speed_mkn();
  i2c_fix.year = fix.dateTime.year;
  i2c_fix.month = fix.dateTime.month;
  i2c_fix.day = fix.dateTime.day;
  i2c_fix.hour = fix.dateTime.hours;
  i2c_fix.minute = fix.dateTime.minutes;
  i2c_fix.second = fix.dateTime.seconds;
}


void i2c_position_request() {
  nmea2struct();
  wireWriteData(i2c_fix);
}
