void printVersionF() {
  Serial.begin(9600);
  delay(10);
  Serial.print("!Firmware version ");
  Serial.println(version);
}

void printFirmwareVersion() {
  Serial.print("Date version: ");
  Serial.print(dat);
  Serial.print("N");
}
bool trueVersion(int command) {
  if (command == mainWindowCommand)return true;
  else return false;
}
