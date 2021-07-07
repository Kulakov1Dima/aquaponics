void rx() {
  while (true) {
    String received="";
    if ( serial.available() > 0)received = serial.readStringUntil('\n');
    if (received != null)if (received.replaceAll(" ", "") != "") {
      data =received.replaceAll("\n", "");
    }
    
    serial.write(writeData);
    serial.clear();
    delay(1100);
    
  }
}
