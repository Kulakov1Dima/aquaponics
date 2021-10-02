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
