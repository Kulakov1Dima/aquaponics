import processing.serial.*;
Serial serial;
String[] port;
byte portTime=0;
String received ="Not found";
int writeData=999;

String scanPonics() {
  port = Serial.list();
  if (port.length==0)return "Подключите ваше устройство и перезапустите программу";
  else {
    return Serial.list()[port.length-1];
  }
}
void requestData() {
  while(true){
   serial.write(writeData);
   if ( serial.available() > 0)data = serial.readStringUntil('\n');
   print (data);
   delay(100);
  }}
  
  void icons() {
  textSize(width/25);
  if (data!="no data available") {
    if (data.split("N").length>1)text(data.split("N")[1], width/5-width/200, height/3+height/25);
    if (data.split("N").length>2)text(data.split("N")[2], width/2-width/100, height/3+height/25);
    if (data.split("N").length>3)text(data.split("N")[3], width/2+width/4+width/50, height/3+height/25);
    if (data.split("N").length>4)text(data.split("N")[4], width/5-width/200, height/2+height/8);
    if (data.split("N").length>5)text(data.split("N")[5], width/2-width/80, height/2+height/11);
    if (data.split("N").length>6)text(data.split("N")[6], width/2-width/80, height/2+height/6);
    if (data.split("N").length>7)text(data.split("N")[7], width/2+width/4+width/50, height/2+height/8);
  }
}
