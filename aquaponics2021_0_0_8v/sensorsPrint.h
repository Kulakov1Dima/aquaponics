void DissolvedOxygen() {
  Serial.print("D");
  receive_and_print_reading(DO);
  Serial.println();
  delay(60);
}
void pH() {
  Serial.print("H");
  receive_and_print_reading(PH);
  Serial.println();
  delay(60);
}
void conductivity() {
  Serial.print("E");
  receive_and_print_reading(EC);
  Serial.println();
  delay(60);
}
void temperature() {
  Serial.print("T");
  receive_and_print_reading(RTD);
  Serial.println();
  delay(60);
}
void co2() {
  Serial.print("O");
  receive_and_print_reading(ORP);
  Serial.println();
  delay(60);
}
