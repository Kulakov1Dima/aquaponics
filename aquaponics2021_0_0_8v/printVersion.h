void prinVersion() {
  Serial.begin(speedSerial);
  if (printVersion) {
    Serial.println("V" + version);
  }
}
