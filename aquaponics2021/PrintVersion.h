void printVersionF() {
  Serial.begin(9600);
  Serial.print("!Firmware version ");
  Serial.println(version);
}

void printFirmwareVersion() {
  Serial.print("Date of last update of the firmware version: ");
  Serial.print(dat);
  Serial.print("N");
}
bool trueVersion(int command) {
  if (command == mainWindowCommand)return true;
  else return false;
}