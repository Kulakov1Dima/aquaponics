#include <Ezo_i2c.h>
#include <Wire.h>
#include <sequencer2.h>
#include <Ezo_i2c_util.h>

#include "configuration.h";
#include "printVersion.h";
#include "sensorsPrint.h";

Sequencer2 Seq(&step1, 500, &step2, 0);

void setup() {
  Wire.begin();                 //enable I2C port.
   Seq.reset();                            //initialize the sequencer
  prinVersion();
}

void loop() {
  if (Serial.available()) {
    Seq.run();
    data = Serial.read();
    Serial.println(data);//beta
    delay(100);//beta version
    prinVersion();
    DissolvedOxygen();
    pH();
    conductivity();
    temperature();
    co2();
  }
}

void step1() {
  DO.send_read_cmd();
  PH.send_read_cmd();
  EC.send_read_cmd();
  RTD.send_read_cmd();
  ORP.send_read_cmd();
}

void step2() {
  if ((RTD.get_error() == Ezo_board::SUCCESS) && (RTD.get_last_received_reading() > -1000.0)) { //if the temperature reading has been received and it is valid
    EC.send_cmd_with_num("T,", RTD.get_last_received_reading());
  } else {                                                                                      //if the temperature reading is invalid
    EC.send_cmd_with_num("T,", 25.0);
  }
}
