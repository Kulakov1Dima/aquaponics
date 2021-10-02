import processing.serial.*;
Serial serial;

String scanPonics= "Подключите ваше устройство и перезапустите программу";
String firmwareVersion="";

void setupRXTX() {
  if (Serial.list().length>0) {
    for (int port=Serial.list().length-1; port>=0; port--)
     if (Serial.list()[port].substring(0, Serial.list()[port].length()-1).equals("/dev/ttyACM")||Serial.list()[port].substring(0, Serial.list()[port].length()-1).equals("COM")) {
        scanPonics =Serial.list()[port];
        serial = new Serial(this, Serial.list()[port], 250000);
        thread("rx");
        thread("tx");
      }
  }
}

void rx() {
  while (true) {
    String received=" ";
    if ( serial.available() > 0) {
      received = serial.readStringUntil('\n');
      if (received != null) {
        received=received.replaceAll("\n", "");
        received=received.replaceAll(" ", "");
        readData=received;
        if(readData.charAt(0)=='V')firmwareVersion=readData.substring(1,readData.length()-1);
      }
    }
    delay(1);
  }
}
void tx() {
  while (true) {
    serial.write(writeData);
    if (writeData==8) {
      secondScreen=0;
    }
    if (writeData==9) {
      secondScreen=0;
    }
    if (writeData==10) {
      secondScreen=0;
    }
    if (writeData==11) {
      secondScreen=0;
    }
    delay(1000) ;
  }
}
