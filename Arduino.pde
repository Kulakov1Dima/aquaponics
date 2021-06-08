String data="no data available";

void requestData() {
  while(true){
   serial.write(writeData);
   if ( serial.available() > 0)data = serial.readStringUntil('\n');
   delay(100);
  }
}
