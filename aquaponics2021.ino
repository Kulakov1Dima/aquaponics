#define version "0.0.4"
#define data "08.06.2021      12:54"

int time =0;
long delayTime=0;

void setup() {
pinMode(13,OUTPUT);
Serial.begin(9600);
Serial.print("Firmware version ");
Serial.println(version);
}

void loop() {
if(Serial.available()){
  time=Serial.read();
  if(time==111){
  time=1000;
  Serial.print("Date of last update of the firmware version: ");
  Serial.println(data);
  }
  if(millis()-delayTime>time){
    delayTime=millis();
    digitalWrite(13,1);
  }
  else digitalWrite(13,0);
}
}
