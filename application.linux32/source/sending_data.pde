
void tx() {
  while (true) {
    serial.write(writeData);
    delay(1200);
  }
}
