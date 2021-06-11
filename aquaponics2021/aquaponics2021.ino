#include "Configuration.h"
#include "PrintVersion.h"

long delayTime = 0;

void setup() {
  pinMode(13, OUTPUT);
  printVersionF();
}

void loop() {
  if (Serial.available()) {
    int data = Serial.read();
    led(data);
    if (trueVersion(data)){printFirmwareVersion();
    DissolvedOxygen();
    pH();
    conductivity();
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
  Serial.println("N");
}
void led(int time) {
  if (millis() - delayTime > time) {
    delayTime = millis();
    digitalWrite(13, 1);
  }
  else digitalWrite(13, 0);
}
