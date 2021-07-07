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

public class aquaponics2021_0_0_7v extends PApplet {

String data="no data available";
String writeData="H00";
String scanPonics= "Подключите ваше устройство и перезапустите программу";

byte secondScreen = 0;

public void setup() {
  
  //size(displayWidth,displayHeight);
  loading();
  thread("clickingTile");
  thread("controllButtons");
}

public void draw() {
  println(data);
  setupWindow();
  definingWindows();
}
public int sizeTilesX(byte number) {
  int i=0;
  if (number==1)i=width/15;
  if (number==2)i=width/3+width/40;
  if (number==3)i=width/3+width/3-width/60;
  if (number==4)i=width/15;
  if (number==5)i=width/3+width/40;
  if (number==6)i=width/3+width/3-width/60;
  if (number==12)i=0;
  if (number==7)i=width/15;
  if (number==8)i=width/3+width/40;
  if (number==9)i=width/2+width/300;
  if (number==10)i=width/3+width/3-width/60;
  if (number==11)i=width/2+width/4+width/22;
  return i;
}
public int sizeTilesY(byte number) {
  int i=0;
  if (number==1)i=height/15+height/7;
  if (number==2)i=height/15+height/7;
  if (number==3)i=height/15+height/7;
  if (number==4)i=height/3-height/250+height/7;
  if (number==5)i=height/3-height/250+height/7;
  if (number==6)i=height/3-height/250+height/7;
  if (number==12)i=0;
  if (number==8)i=height/2+height/4-height/80;
  if (number==9) i=height/2+height/4-height/80;
  if (number==10) i=height/2+height/4-height/80;
  if (number==11) i=height/2+height/4-height/80;
  if (number==7) i=height/2+height/4-height/80;
  return i;
}
public int sizeTilesW(byte number) {
  int i=0;
  if (number==12)i=width/18;
  else {
    i=width/3-width/20;
    if (number==8)i=width/2-width/3-width/35;
    if (number==9)i=width/2-width/3-width/35;
    if (number==10)i=width/2-width/3-width/35;
    if (number==11)i=width/2-width/3-width/35;
    if (number==7)i=width/2-width/3-width/35;
  }
  return i;
}
public int sizeTilesH(byte number) {
  int i=0;
  if (number==12)i=height;
  else {
    i=height/4;
    if (number==8)i=height/9;
    if (number==9)i=height/9;
    if (number==10)i=height/9;
    if (number==11)i=height/9;
    if (number==7)i=height/9;
  }
  return i;
}
public void clickingTile() {
  while (true) {
    for (byte x=1; x<8; x++) {
      if (secondScreen==0)if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x)&&mousePressed)secondScreen=x;
      if (secondScreen!=0)if (secondScreen!=7)if (mouseX>sizeTilesX((byte)12)&&mouseY>sizeTilesY((byte)12)&&mouseX<sizeTilesW((byte)12)+sizeTilesX((byte)12)&&mouseY<sizeTilesH((byte)12)+sizeTilesY((byte)12)&&mousePressed)
        if (loadStrings("configuration.txt")[0].equals("transparencyON"))secondScreen=12;
        else secondScreen=0;
    }
  }
}
public void definingWindows() { 
  if (secondScreen==1)background(255, 200, 10);
  if (secondScreen==2)background(200, 0, 0);
  if (secondScreen==3)background(0, 100, 0);
  if (secondScreen==4)background(150, 150, 150);
  if (secondScreen==5)background(56, 160, 205);
  if (secondScreen==6)background(255, 100, 0);
  if (secondScreen!=0 && secondScreen!=8 && secondScreen!=9 && secondScreen!=10 && secondScreen!=11 && secondScreen!=7) {
    if (secondScreen!=12) {
      fill(255);
      rect(sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
      if (mouseX>sizeTilesX((byte)12)&&mouseY>sizeTilesY((byte)12)&&mouseX<sizeTilesW((byte)12)+sizeTilesX((byte)12)&&mouseY<sizeTilesH((byte)12)+sizeTilesY((byte)12))tileTransparency=170;
      else tileTransparency=225;
      tint(tileTransparency);
      image(tiles[11], sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
    }
  }
  if (secondScreen==7)panelSettings();
}

Serial serial;

public void setupRXTX() {
  if (Serial.list().length!=0) {
     if (Serial.list().length-1>=0){
      serial = new Serial(this, Serial.list()[4], 9600);
      scanPonics=Serial.list()[4];
    thread("rx");
     }
  }
}
boolean pump[] = new boolean[4];
boolean w= false;
public void controllButtons() {
  while (true) {
    for (byte x=8; x<12; x++) {
      if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x)) {
        if (mousePressed)w= true;
        if (w&&!mousePressed) {
          pump[x-8]=!pump[x-8];
          if (pump[x-8])writeData="M1"+(x-7);
          else writeData="M0"+(x-7);
          for(int v=0; v<=5;v++){
            serial.write(writeData);
          }
          w=false;
        }
      }
    }
  }
}
PImage darkSetupWindow;
PImage lightSetupWindow;
PImage tiles[] = new PImage[12];
PImage Ltiles[] = new PImage[12];
PImage transparency;
String load;
boolean loadT= false;

public void loading() {
  loadingScreen();
  setupRXTX();
  darkSetupWindow = loadImage ("darkSetupWindow.png");
  lightSetupWindow =loadImage ("lightSetupWindow.png");
  for (byte x=0; x<12; x++)tiles[x]= loadImage ("Tiles"+(int)(x+1)+".png");
  for (byte x=0; x<12; x++)Ltiles[x]= loadImage ("LTiles"+(int)(x+1)+".png");
  transparency=loadImage("transparency.png");
  loadT=true;
}

public void loadingScreen() {
  load=loadStrings("configuration.txt")[1];
  if (load.equals("darkTheme")) {
    background(0);
    fill(255);
  } else {
    background(255);
    fill(0);
  }
  textSize(width/15);
  text("Loading...", width/2-width/7, height/2);
  textSize(width/50);
  text("Aquaponics 0.0.7", width/2-width/12, height-height/10);
}
public void rx() {
  while (true) {
    String received="";
    if ( serial.available() > 0)received = serial.readStringUntil('\n');
    if (received != null)if (received.replaceAll(" ", "") != "") {
      data =received.replaceAll("\n", "");
    }
    
    serial.write(writeData);
    serial.clear();
    delay(1100);
    
  }
}

public void tx() {
  while (true) {
    serial.write(writeData);
    delay(1200);
  }
}
boolean startWindow = true;
boolean n;
byte in=0;
int tileTransparency=100;

PrintWriter output;
String[] textLines;
int k=0;

public void setupWindow() {
  if (secondScreen == 12) {
    in=0;
    secondScreen = 0;
    startWindow=true;
  }
  if (startWindow)windowEffects();
  else if (load.equals("darkTheme"))background(0);
  else background(255);
  illuminationTile();
  tiles();
  if (!startWindow)icons();

  if (loadStrings("configuration.txt")[1].equals("darkTheme")) {
    fill(255);
  }
  if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
    fill(0);
  }
  if (!startWindow) {
    textSize(width/45);
    text(scanPonics, width/15, height/7+height/50);
    textSize(width/24);
    text("Aquaponics", width/2+width/10, height/10);
    fill(100, 230, 100);
    if (loadStrings("configuration.txt")[1].equals("lightTheme"))fill(20, 160, 30);
    text("Zero", width/2+width/3+width/75, height/10);
    textSize(width/42);
    text("Номер порта", width/15, height/10);
  }
}

public void illuminationTile() {
  if (in>60) {
    startWindow=false;
    if (load.equals("darkTheme"))
    {
      fill(255);
      for (byte x=1; x<12; x++)rect(sizeTilesX(x)-1, sizeTilesY(x)-1, sizeTilesW(x)+1, sizeTilesH(x)+1);
    }
  }
}

public void  windowEffects() {
  if (loadT) {
    in+=30;
    tint(255, 50+in);
    if (load.equals("lightTheme"))image(lightSetupWindow, 0, 0, width, height);
    else image(darkSetupWindow, 0, 0, width, height);
    tint(255, 10+in*2);
  }
}

public void tiles() {
  for (byte x=1; x<12; x++) {
    if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x))tileTransparency=170;
    else tileTransparency=225;
    if (!startWindow)tint(255, tileTransparency);
    if (load.equals("lightTheme"))image(Ltiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
    else image(tiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
  }
}

//version 0.0.6
public void panelSettings() {
  if (loadStrings("configuration.txt")[0].equals("transparencyON")) {
    tint(255, 180);
    image (loadImage("rightPanel.png"), 0, 0, width/3, height);
    exitSettings();
  } else { 
    tint(255, 255);
    image (loadImage("rightPanel.png"), 0, 0, width/3, height);
    exitSettings();
  }
  buttonSettings(); 
  transparencyButton();
  themeButton();
  }
public void buttonSettings() {
  image (transparency, width/45, height/7-height/130, width/17, height/10-height/210);
  image (transparency, width/45, height/4-height/250, width/17, height/10-height/210);
}
public void transparencyButton() {
  if (mouseX>=width/45 && mouseY>=height/7 && mouseX<=width/17+width/45 && mouseY<= height/10+height/7) {
    fill(10);
    stroke(255);
    ellipse(width/20+width/850, height/5-height/55, width/18+width/500, height/10-height/135);
    if (mousePressed) {
      n=true;
    } else {
      if (n) {
        textLines = loadStrings("configuration.txt");
        output = createWriter("data/configuration.txt"); 
        if (textLines[0].equals("transparencyON"))output.println("transparencyOFF");
        else output.println("transparencyON");
        output.println(textLines[1]);
        output.println(n);
        output.flush();
        output.close();
        n=false;
      }
    }
  }
  settingsPanel();
}
public void themeButton() {
  if (mouseX>=width/45 && mouseY>=height/4 && mouseX<=width/17+width/45 && mouseY<= height/12+height/4) {
    fill(10);
    stroke(255);
    ellipse(width/20+width/850, height/3-height/25, width/18+width/510, height/10-height/135);
    if (mousePressed) {
      n=true;
      delay (100);
    } else {
      if (n) {
        textLines = loadStrings("configuration.txt");
        output = createWriter("data/configuration.txt"); 
        output.println(textLines[0]);
        if (textLines[1].equals("darkTheme"))output.println("lightTheme");
        else output.println("darkTheme");
        output.println(n);
        output.flush();
        output.close();
        n=false;
        load=loadStrings("configuration.txt")[1];
      }
    }
  }
  settingsPanel();
}
public void settingsPanel() {
  rectStatus(); 
  fill(200);
  textSize(width/80);
  if (loadStrings("configuration.txt")[1].equals("darkTheme"))text("Тёмная", width/5+width/26, height/3-height/35);
  if (loadStrings("configuration.txt")[1].equals("lightTheme"))text("Cветлая", width/5+width/26, height/3-height/35);
  if (loadStrings("configuration.txt")[0].equals("transparencyON"))text("Вкл", width/5+width/20, height/4-height/17);
  if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))text("Выкл", width/5+width/22, height/4-height/17);
}
public void rectStatus() {
  fill(0);
  stroke(255);
  for (int h=0; h<=600; h+=width/15-width/350)rect(width/5+width/35, height/6+height/300+h, width/15, height/30, 15);
}
public void exitSettings() {
  if (mouseY<=height/10 && mouseX<=width/20) {
    fill(0);
    stroke(100);
    if (mousePressed) {
      fill(10);
      delay(200);
      secondScreen=0;
    }
  } else {
    fill(10);
    stroke(0);
  }
  if (secondScreen!=0) {
    stroke(150);
    rect(0, 0, width/20, height/10);
    fill(255);
    textSize(height/30);
    text("<", width/90, height/20);
  }
}

public void icons() {
  textSize(width/25);
  if (data!="no data available") {
    if (load.equals("darkTheme"))fill(10);
    else fill(255);
    if (data.split("N").length>1)if (data.split("N")[1].split(" ").length>1)text(data.split("N")[1].split(" ")[1], width/5-width/35, height/3+height/25);
    if (data.split("N").length>2)if (data.split("N")[2].split(" ").length>1)text(data.split("N")[2].split(" ")[1], width/2-width/100, height/3+height/25);
    if (data.split("N").length>3)if (data.split("N")[3].split(" ").length>1)text(data.split("N")[3].split(" ")[1], width/2+width/4+width/50, height/3+height/25);
    if (data.split("N").length>4)if (data.split("N")[4].split(" ").length>1){textSize(width/5/(data.split("N")[4].split(" ")[1].length()));
    if (data.split("N").length>4)if (data.split("N")[4].split(" ").length>1)text(data.split("N")[4].split(" ")[1],width/3/(data.split("N")[4].split(" ")[1].length())+width/8, height/2+height/8);
    }
    textSize(width/25);
    if (data.split("N").length>5)text(data.split("N")[5], width/2-width/80, height/2+height/11);
    if (data.split("N").length>6)text(data.split("N")[6], width/2-width/80, height/2+height/6);
    if (data.split("N").length>7)if (data.split("N")[7].split(" ").length>1){
    textSize(width/5/(data.split("N")[7].split(" ")[1].length()));
    if (data.split("N").length>7)text(data.split("N")[7].split(" ")[1], width/2+width/4, height/2+height/8);
    }
    textSize(width/50);
    if (data.split("N").length>8)text(data.split("N")[8], width/2-width/14, height/2+height/3-height/50);
    if (data.split("N").length>9)text(data.split("N")[9], width/2+width/13, height/2+height/3-height/50);
    if (data.split("N").length>10)text(data.split("N")[10], width/2+width/5+width/50, height/2+height/3-height/50);
    if (data.split("N").length>11)text(data.split("N")[11], width/2+width/4+width/9, height/2+height/3-height/50);
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "aquaponics2021_0_0_7v" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
