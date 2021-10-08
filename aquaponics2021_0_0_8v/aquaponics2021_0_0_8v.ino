#include <Ezo_i2c.h>
#include <Wire.h>
#include <sequencer2.h>
#include <Ezo_i2c_util.h>

#include "configuration.h";
#include "printVersion.h";
#include "sensorsPrint.h";

Sequencer2 Seq(&step1, 1000, &step2, 0);

void setup() {
  prinVersion();
}

void loop() {
  if (Serial.available()) {
    data = Serial.read();
    //Serial.println(data);
    DissolvedOxygen();
    pH();
  }
}
...

void step1() {
  DO.send_read_cmd();
  PH.send_read_cmd();
}

void step2() {
  
}
