#include "Configuration.h"
#include "PrintVersion.h"

long delayTime = 0;

void setup() {
  pinMode(13, OUTPUT);
  printVersionF();
  Serial.print("l");
}

void loop() {
  if (Serial.available()) {
    int data = Serial.read();
    led(data);
    if (trueVersion(data)){printFirmwareVersion();
    DissolvedOxygen();
    pH();
    conductivity();
    temperature();
    pump1();
    pump2();
    co2();
    }
  }
}
void DissolvedOxygen(){
  Serial.print(analogRead(A0));
  Serial.print("N");
}
void pH(){
  Serial.print(analogRead(A1));
  Serial.print("N");
}
void conductivity(){
  Serial.print(analogRead(A2));
  Serial.print("N");
}
void temperature(){
  Serial.print(analogRead(A3));
  Serial.print("N");
}
void pump1(){
  Serial.print(analogRead(A4));
  Serial.print("N");
}
void pump2(){
  Serial.print(analogRead(A5));
  Serial.print("N");
}
void co2(){
  Serial.print(analogRead(A6));
  Serial.println("N");
}
void led(int time) {
  if (millis() - delayTime > time) {
    delayTime = millis();
    digitalWrite(13, 1);
  }
  else digitalWrite(13, 0);
}
