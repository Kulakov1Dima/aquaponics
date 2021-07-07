#include "Configuration.h"

#include <Ezo_i2c.h> //include the EZO I2C library from https://github.com/Atlas-Scientific/Ezo_I2c_lib
#include <Wire.h>    //include arduinos i2c library
#include <sequencer2.h> //imports a 2 function sequencer 
#include <Ezo_i2c_util.h> //brings in common print statements

boolean p1 = false;
boolean p2 = false;
boolean p3 = false;
boolean p4 = false;

volatile int  pulse_frequency1;
unsigned int  literperhour1;
volatile int  pulse_frequency2;
unsigned int  literperhour2;
unsigned long currentTime, loopTime;
byte sensorInterrupt1 = 0;
byte sensorInterrupt2 = 1;

Ezo_board PH = Ezo_board(99);       //create a PH circuit object, who's address is 99 and name is "PH"
Ezo_board EC = Ezo_board(100);      //create an EC circuit object who's address is 100 and name is "EC"
Ezo_board RTD = Ezo_board(102);
Ezo_board DO = Ezo_board(97);
Ezo_board ORP = Ezo_board(98);

void step1();  //forward declarations of functions to use them in the sequencer before defining them
void step2();

Sequencer2 Seq(&step1, 1000, &step2, 0);  //calls the steps in sequence with time in between them

void setup() {
  Serial.begin(9600);
  pinMode(pump1, OUTPUT);
  pinMode(pump2, OUTPUT);
  pinMode(pump3, OUTPUT);
  pinMode(pump4, OUTPUT);
  Wire.begin();                 //enable I2C port.
  Seq.reset();                            //initialize the sequencer
  pinMode(FLOWSENSORPIN1, INPUT);
  attachInterrupt(sensorInterrupt1, getFlow1, FALLING);
  pinMode(FLOWSENSORPIN2, INPUT);
  attachInterrupt(sensorInterrupt2, getFlow2, FALLING);
  currentTime = millis();
  loopTime = currentTime;
}

void loop() {
  Seq.run();
  if (Serial.available()) {
    String data = Serial.readString();
    if (data.length() > 3)data = data.substring(3, 6);
    if (data == "M11") {
      digitalWrite(pump1, 1);
      p1 = true;
    }
    if (data == "M01") {
      digitalWrite(pump1, 0);
      p1 = false;
    }
    if (data == "M12") {
      digitalWrite(pump2, 1);
      p2 = true;
    }
    if (data == "M02") {
      digitalWrite(pump2, 0);
      p2 = false;
    }
    if (data == "M13") {
      digitalWrite(pump3, 1);
      p3 = true;
    }
    if (data == "M03") {
      digitalWrite(pump3, 0);
      p3 = false;
    }
    if (data == "M14") {
      digitalWrite(pump4, 1);
      p4 = true;
    }
    if (data == "M04") {
      digitalWrite(pump4, 0);
      p4 = false;
    }
    Serial.print("N");
    DissolvedOxygen();
    pH();
    conductivity();
    temperature();
    pump1S();
    pump2S();
    co2();
    pm1();
    pm2();
    pm3();
    pm4();
  }
  currentTime = millis();
  if (currentTime >= (loopTime + 1000))
  {
    loopTime = currentTime;
    literperhour2 = (pulse_frequency2 * 60 / 7.5);
    pulse_frequency2 = 0;
    literperhour1 = (pulse_frequency1 * 60 / 7.5);
    pulse_frequency1 = 0;
  }
}
void DissolvedOxygen() {
  receive_and_print_reading(DO);
  Serial.print("N");
}
void pH() {
  receive_and_print_reading(PH);             //get the reading from the PH circuit
  Serial.print("N");
}
void conductivity() {
  receive_and_print_reading(EC);             //get the reading from the EC circuit
  Serial.print("N");
}
void temperature() {
  receive_and_print_reading(RTD);
  Serial.print("N");
}
void pump1S() {
  Serial.print(literperhour1, DEC);
  Serial.print("N");
}
void pump2S() {
  Serial.print(literperhour2, DEC);
  Serial.print("N");
}
void co2() {
  receive_and_print_reading(ORP);
  Serial.print("N");
}
void pm1() {
  String x = "off";
  if (p1)x = "on";
  Serial.print(x);
  Serial.print("N");
}
void pm2() {
  String x = "off";
  if (p2)x = "on";
  Serial.print(x);
  Serial.print("N");
}
void pm3() {
  String x = "off";
  if (p3)x = "on";
  Serial.print(x);
  Serial.print("N");
}
void pm4() {
  String x = "off";
  if (p4)x = "on";
  Serial.print(x);
  Serial.println("N");
}

void step1() {
  //send a read command. we use this command instead of PH.send_cmd("R");
  //to let the library know to parse the reading
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
void getFlow1 ()
{
  pulse_frequency1++;
}

void getFlow2 ()
{
  pulse_frequency2++;
}
