import processing.serial.*;
Serial serial;

boolean setupRXTX() {
  if (Serial.list().length!=0) {
    serial = new Serial(this, Serial.list()[0], 9600);
    scanPonics=Serial.list()[0];
    return (true);
  } else return (false);
}
