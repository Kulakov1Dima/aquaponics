import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class aquaponics2021_0_0_5v extends PApplet {

MyButton btn1=new MyButton();
MyButton btn2=new MyButton();
MyButton btn3=new MyButton();
MyButton btn4=new MyButton();
MyButton btn5=new MyButton();
MyButton btn6=new MyButton();
MyButton btn7=new MyButton();

PImage temperature;
PImage dissolvedOxygen;
PImage pH;
PImage Conductivity;
PImage pump;
PImage co2;

byte secondScreen =0;

public void setup() {
  
  background(0);
  //tint(255, 220);
  temperature = loadImage("b45f8e4366b41a30994d6b5b3bb2d51b.png");
  dissolvedOxygen = loadImage("Растворенный кислород.png");
  pH = loadImage("pH.png");
  Conductivity=loadImage("Conductivity.png");
  pump =loadImage("Pump.png");
  co2 =loadImage("co2.png");
  button1(width/15, height/15+height/7, width/3-width/20, height/4, 255, 200, 0);
  button2(width/3+width/40, height/15+height/7, width/3-width/20, height/4, 230, 0, 0);
  button3(width/3+width/3-width/60, height/15+height/7, width/3-width/20, height/4, 0, 150, 0);
  button4(width/15, height/3-height/250+height/7, width/3-width/20, height/4, 150, 150, 150);
  button5(width/3+width/40, height/3-height/250+height/7, width/3-width/20, height/4, 56, 160, 205);
  button6(width/3+width/3-width/60, height/3-height/250+height/7, width/3-width/20, height/4, 255, 120, 0);
  button7(0, 0, width/20, height/20, 0, 0, 0, " <");
}

public void draw() {
  if (secondScreen==0)setupWindow();
  if (secondScreen==0)if (btn1.ButtonDraw()) button1();
  if (secondScreen==0)if (btn2.ButtonDraw()) button2();
  if (secondScreen==0)if (btn3.ButtonDraw()) button3();
  if (secondScreen==0)if (btn4.ButtonDraw()) button4();
  if (secondScreen==0)if (btn5.ButtonDraw()) button5();
  if (secondScreen==0)if (btn6.ButtonDraw()) button6();
  if (secondScreen==1)button1();
  if (secondScreen==2)button2();
  if (secondScreen==3)button3();
  if (secondScreen==4)button4();
  if (secondScreen==5)button5();
  if (secondScreen==6)button6();
  if (secondScreen==0) {
    icons();
    writeData=111;
  }
}
public void button1() {
  secondScreen=1;
  background(255, 200, 10);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=2000;
}
public void button2() {
  secondScreen=2;
  fill(200, 0, 0);
  rect(0, 0, width, height);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=3000;
}
public void button3() {
  secondScreen=3;
  background(0, 100, 0);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=4000;
}
public void button4() {
  secondScreen=4;
  background(150, 150, 150);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=100;
}
public void button5() {
  secondScreen=5;
  background(56, 160, 205);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=500;
}
public void button6() {
  secondScreen=6;
  background(255, 100, 0);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=5000;
}
String data="no data available";

public void requestData() {
  while(true){
   serial.write(writeData);
   if ( serial.available() > 0)data = serial.readStringUntil('\n');
   delay(100);
  }
}
public void icons() {
  textSize(width/50);
  fill(0);

  image (dissolvedOxygen, width/14, height/4, width/10-width/200, height/7+height/50);
  text("Dissolved Oxygen", width/6, height/4+height/200);
  text("mg/L", width/4+width/25, height/3+height/25);

  image (pH, width/2-width/8-width/110, height/4, width/10-width/170, height/7+height/50);
  text("pH", width/2, height/4+height/200);

  image(Conductivity, width/2+width/6, height/4-height/100, width/10-width/170, height/7+height/50);
  text("EC", width/2+width/3, height/4+height/200);
  text("uS", width/2+width/3+width/25, height/3+height/25);

  image (temperature, width/13, height/2+height/40, width/12, height/7);
  text("Temperature", width/6+width/60, height/2+height/70);
  text("C°", width/4+width/20, height/2+height/8);

  image (pump, width/2-width/8-width/110, height/2+height/40, width/10, height/7);
  text("Pump", width/2, height/2+height/70);
  text("ml", width/2+width/10, height/2+height/8);

  image(co2, width/2+width/7+width/150, height/3+height/6-height/150, width/9-width/200, height/7+height/20);
  text("CO2", width/2+width/3, height/2+height/70);
  text("ppm", width/2+width/3+width/25, height/2+height/8);

  textSize(width/25);
  if (data!="no data available") {
    if (data.split("N").length>1)text(data.split("N")[1], width/5-width/200, height/3+height/25);
    if (data.split("N").length>2)text(data.split("N")[2], width/2-width/100, height/3+height/25);
    if (data.split("N").length>3)text(data.split("N")[3], width/2+width/4+width/50, height/3+height/25);
    if (data.split("N").length>4)text(data.split("N")[4], width/5-width/200, height/2+height/8);
    if (data.split("N").length>5)text(data.split("N")[5], width/2-width/100, height/2+height/8);
    if (data.split("N").length>6)text(data.split("N")[6], width/2+width/4+width/50, height/2+height/8);
  }
}
public void button1(float x,float y,float w,float h,int r,int g,int b){
  btn1.x=x;
  btn1.y=y;
  btn1.w=w;
  btn1.h=h;
  btn1.btnColor=color(r,g,b);
  btn1.btnRollOver=color(r,g+20,b);
}
public void button2(float x,float y,float w,float h,int r,int g,int b){
  btn2.x=x;
  btn2.y=y;
  btn2.w=w;
  btn2.h=h;
  btn2.btnColor=color(r,g,b);
  btn2.btnRollOver=color(r+30,g+20,b+20);
}
public void button3(float x,float y,float w,float h,int r,int g,int b){
  btn3.x=x;
  btn3.y=y;
  btn3.w=w;
  btn3.h=h;
  btn3.btnColor=color(r,g,b);
  btn3.btnRollOver=color(r+20,g+20,b+20);
}
public void button4(float x,float y,float w,float h,int r,int g,int b){
  btn4.x=x;
  btn4.y=y;
  btn4.w=w;
  btn4.h=h;
  btn4.btnColor=color(r,g,b);
  btn4.btnRollOver=color(r+20,g+20,b+20);
}
public void button5(float x,float y,float w,float h,int r,int g,int b){
  btn5.x=x;
  btn5.y=y;
  btn5.w=w;
  btn5.h=h;
  btn5.btnColor=color(r,g,b);
  btn5.btnRollOver=color(r+20,g+20,b+20);
}
public void button6(float x,float y,float w,float h,int r,int g,int b){
  btn6.x=x;
  btn6.y=y;
  btn6.w=w;
  btn6.h=h;
  btn6.btnColor=color(r,g,b);
  btn6.btnRollOver=color(r+30,g+30,b+30);
}
public void button7(float x,float y,float w,float h,int r,int g,int b, String s){
  btn7.x=x;
  btn7.y=y;
  btn7.w=w;
  btn7.h=h;
  btn7.btnColor=color(r,g,b);
  btn7.btnRollOver=color(r+30,g+30,b+30);
  btn7.label=s;
  btn7.txColor=255;
}

class MyButton{

float x;
float y;
float w;
float h;

int u=0;

int btnColor=color(0);
int btnRollOver=color(0);

String label="";
float lX=20;
float lY=30;
int ts=25;
int txColor=color(0);

boolean btnClicked=false;

public boolean ButtonDraw(){

noStroke();
fill(0,0,0,75);
rect(x+3,y+5,w+3,h+3,u);

stroke(1);

if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
fill(btnRollOver);
if (mousePressed){btnClicked=true; }
else {btnClicked=false;}

} else {
fill(btnColor);
btnClicked=false;
}
rect(x,y,w,h,u);
fill(txColor);
textSize(ts);
text(label,x+lX,y+lY);
return btnClicked;
}}

Serial serial;

String[] port;
int writeData=999;
byte portTime=0;
String received ="Not found";

public String scanPonics() {
  port = Serial.list();
  if (port.length==0)return "Подключите ваше устройство и перезапустите программу";
  else {
    return Serial.list()[port.length-1];
  }
}

public void setupWindow() {
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
  if (data.length()!=0)text(data.split("N")[0], width/15, height/2+height/3);
  portTime=1;
  if (data.length()!=0)println(data);
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "aquaponics2021_0_0_5v" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
