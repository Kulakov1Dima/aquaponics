import processing.serial.*;

Serial serial;

String[] port;

int portTime=0;

String scanPonics(){
  port = Serial.list();
  if (port.length==0)return "Подключите ваше устройство и перезапустите ПО";
  else{
    return Serial.list()[port.length-1];
  }}
  
void setupWindow() {
  background(0);
  fill(255);
  textSize(width/100);
  text("для выхода нажмите Esc", width/2+width/3, height/2+height/3+height/10);
  textSize(width/29);
  text("Aquaponics", width/2+width/7+width/100, height/10);
  fill(100, 200, 100);
  text("Zero", width/2+width/3+width/50, height/10);
  textSize(width/60);
  text("Имя порта вашего устройства", width/15, height/10);
  fill(255);
  text(scanPonics(), width/15, height/7);
  if(portTime==0)if (port.length!=0)serial = new Serial(this, scanPonics(), 9600);
  portTime++;
}
