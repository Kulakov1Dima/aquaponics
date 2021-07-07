import processing.serial.*;
Serial serial;

void setupRXTX() {
  if (Serial.list().length!=0) {
     if (Serial.list().length-1>=0){
      serial = new Serial(this, Serial.list()[4], 9600);
      scanPonics=Serial.list()[4];
    thread("rx");
     }
  }
}
