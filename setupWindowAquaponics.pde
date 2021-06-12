import processing.serial.*;
Serial serial;

String[] port;
int writeData=999;
byte portTime=0;
String received ="Not found";

String scanPonics() {
  port = Serial.list();
  if (port.length==0)return "Подключите ваше устройство и перезапустите программу";
  else {
    return Serial.list()[port.length-1];
  }
}

void setupWindow() {
  background(0);
  fill(255);
  textSize(width/80);
  text("для выхода нажмите Esc", width/2+width/4+width/35, height/2+height/3+height/10);
  textSize(width/29);
  text("Aquaponics", width/2+width/7+width/100, height/10);
  fill(100, 230, 100);
  text("Zero", width/2+width/3+width/50, height/10);
  textSize(width/60);
  text("Имя порта вашего устройства:", width/15, height/10);
  fill(255);
  text(scanPonics(), width/15, height/7+height/100);
  if (portTime==0)if (port.length!=0) {
    serial = new Serial(this, scanPonics(), 9600);
    delay(1500);
    
    //while( serial.available()==0)serial.write("ok");
    if ( serial.available() > 0) {
      received = serial.readStringUntil('\n');
      writeData=111;
      thread("requestData");
    }
  }
  if(received.split("!").length>1)text(received.split("!")[1], width/2+width/6-width/70, height/7+height/100);
  //if (data.length()!=0)text(data.split("N")[0], width/15, height/2+height/3);
  portTime=1;
  if (data.length()!=0)println(data);
}
