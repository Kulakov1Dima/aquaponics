#include "Configuration.h"
#include "PrintVersion.h"

boolean p1 = false;
boolean p2 = false;
boolean p3 = false;
boolean p4 = false;

long delayTime = 0;

void setup() {
  pinMode(13, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available()) {
    String data = Serial.readString();
    if (data.length() > 3)data = data.substring(3, 6);
    if (data == "M11")p1 = true;
    if (data == "M01")p1 = false;
    if (data == "M12")p2 = true;
    if (data == "M02")p2 = false;
    if (data == "M13")p3 = true;
    if (data == "M03")p3 = false;
    if (data == "M14")p4 = true;
    if (data == "M04")p4 = false;
    Serial.print("N");
    DissolvedOxygen();
    pH();
    conductivity();
    temperature();
    pump1();
    pump2();
    co2();
    pm1();
    pm2();
    pm3();
    pm4();
  }
}
void DissolvedOxygen() {
  Serial.print(analogRead(A0));
  Serial.print("N");
}
void pH() {
  Serial.print(analogRead(A1));
  Serial.print("N");
}
void conductivity() {
  Serial.print(analogRead(A2));
  Serial.print("N");
}
void temperature() {
  Serial.print(analogRead(A3));
  Serial.print("N");
}
void pump1() {
  Serial.print(analogRead(A4));
  Serial.print("N");
}
void pump2() {
  Serial.print(analogRead(A5));
  Serial.print("N");
}
void co2() {
  Serial.print(analogRead(A6));
  Serial.print("N");
}
void pm1() {
  String x = "off";
  if (p1)x = "on";
  Serial.print(x);
  Serial.print("N");
}
void pm2() {
  String x = "off";
  if (p2)x = "on";
  Serial.print(x);
  Serial.print("N");
}
void pm3() {
  String x = "off";
  if (p3)x = "on";
  Serial.print(x);
  Serial.print("N");
}
void pm4() {
  String x = "off";
  if (p4)x = "on";
  Serial.print(x);
  Serial.println("N");
}
