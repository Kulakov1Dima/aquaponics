
void tx() {
  while (true) {
    serial.write(writeData);
    delay(500);
    serial.clear();
    delay(500);
    ;
  }
}
