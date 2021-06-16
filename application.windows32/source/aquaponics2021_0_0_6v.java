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

public class aquaponics2021_0_0_6v extends PApplet {

byte secondScreen = 0;
boolean theme;
boolean n;
PImage transparency;

String data="no data available";


public void setup() {
  transparency=loadImage("transparency.png");
  
  background(0);
}
public void draw() {
  TileGraphics();
}

public void TileGraphics() {
  if (secondScreen==0) {
    setupWindow();
  }
  for (byte i=1; i<=8; i++)if (secondScreen==0)if (i!=7)if (tiles((byte)i))secondScreen=i;
  if (secondScreen==0) { 
    if (loadStrings("configuration.txt")[1].equals("darkTheme")) {
      fill(0);
    }
    if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
      fill(255);
    }
    icons();
  }
  definingWindows();
}

public void definingWindows() { 
  if (secondScreen==1)background(255, 200, 10);
  if (secondScreen==2)background(200, 0, 0);
  if (secondScreen==3)background(0, 100, 0);
  if (secondScreen==4)background(150, 150, 150);
  if (secondScreen==5)background(56, 160, 205);
  if (secondScreen==6)background(255, 100, 0);
  if (secondScreen!=0 && secondScreen!=8)if (tiles((byte)7))secondScreen=0;
  if (secondScreen==8)panelSettings();
}

Serial serial;
String[] port;
byte portTime=0;
String received ="Not found";
int writeData=999;

public String scanPonics() {
  port = Serial.list();
  if (port.length==0)return "Подключите ваше устройство и перезапустите программу";
  else {
    return Serial.list()[port.length-1];
  }
}
public void requestData() {
  while(true){
   serial.write(writeData);
   if ( serial.available() > 0)data = serial.readStringUntil('\n');
   print (data);
   delay(100);
  }}
  
  public void icons() {
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
byte statusTiles;
public boolean tiles(byte number) {
  if (mouseX > sizeTilesX(number) && mouseX < sizeTilesX(number) + sizeTilesW(number) && mouseY > sizeTilesY(number) && mouseY < sizeTilesY(number) + sizeTilesH(number))statusTiles=1;
  else statusTiles=0;
  if (secondScreen==0)loadingTiles(number, statusTiles);
  else loadingTiles((byte)7, statusTiles);
  if (mousePressed && statusTiles==1)return true;
  else return false;
}

public int sizeTilesX(byte number) {
  int i=0;
  if (number==1)i=width/15;
  if (number==2)i=width/3+width/40;
  if (number==3)i=width/3+width/3-width/60;
  if (number==4)i=width/15;
  if (number==5)i=width/3+width/40;
  if (number==6)i=width/3+width/3-width/60;
  if (number==7)i=0;
  if (number==8)i=width/15;
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
  if (number==7)i=0;
  if (number==8)i=height/2+height/4-height/80;
  return i;
}
public int sizeTilesW(byte number) {
  int i=0;
  if (number==7)i=width/18;
  else {
    i=width/3-width/20;
    if (number==8)i=width/2-width/3-width/45;
  }
  return i;
}
public int sizeTilesH(byte number) {
  int i=0;
  if (number==7)i=height;
  else {
    i=height/4;
    if (number==8)i=height/9;
  }
  return i;
}
public void loadingTiles(byte number, int statusTiles) {
  if (number==7&&statusTiles==1) tint(255, 190);
  else {
    if (number==7)tint(255, 220);
    else tint(255, 255);
  }
  if (loadStrings("configuration.txt")[1].equals("darkTheme"))image (loadImage("Tiles"+number+""+statusTiles+".png"), sizeTilesX(number), sizeTilesY(number), sizeTilesW(number), sizeTilesH(number));
  if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
    if (statusTiles==1)tint(255, 100);
    else tint(255, 200);
    image (loadImage("Tiles"+number+".png"), sizeTilesX(number), sizeTilesY(number), sizeTilesW(number), sizeTilesH(number));
  }
}
PrintWriter output;
String[] textLines;
int i=0;
int k=0;
boolean drawButton=false;
public void setupWindow() {
  if (loadStrings("configuration.txt")[1].equals("darkTheme")) {
    background(0);
    fill(255);
  }
  if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
    background(255);
    fill(0);
  }
  textSize(width/45);
  text(scanPonics(), width/15, height/7+height/50);
  if (portTime==0)if (port.length!=0) {
    serial = new Serial(this, scanPonics(), 9600);
    delay(1500);

    //while( serial.available()==0)serial.write("ok");
    if ( serial.available() > 0) {
      received = serial.readStringUntil('\n');
      writeData=111;
      thread("requestData");
    }
    if (received.split("!").length>1)text(received.split("!")[1], width/2+width/6-width/70, height/7+height/100);
    //if (data.length()!=0)text(data.split("N")[0], width/15, height/2+height/3);
    portTime=1;
    if (data.length()!=0)println(data);
  }

  textSize(width/24);
  text("Aquaponics", width/2+width/10, height/10);
  fill(100, 230, 100);
  if (loadStrings("configuration.txt")[1].equals("lightTheme"))fill(20, 160, 30);
  text("Zero", width/2+width/3+width/75, height/10);
  textSize(width/42);
  text("Имя порта вашего устройства:", width/15, height/10);
}

public void panelSettings() {
  i+=2;
  if (loadStrings("configuration.txt")[0].equals("transparencyON")) {
    tint(255, 40);
    if (i<22 && secondScreen!=0)image (loadImage("rightPanel.png"), 0, 0, width/3+width/100, height);
    else exitSettings();
  } else { 
    tint(255, 255);
    image (loadImage("rightPanel.png"), 0, 0, width/3+width/100, height);
    exitSettings();
  }
  if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))buttonSettings(); 
  else if (i>10) buttonSettings();
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
      delay (100);
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
      }
    }
  }
  settingsPanel();
}
public void settingsPanel() {
  if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))rectStatus(); 
  else if (i>21)rectStatus();
  fill(200);
  textSize(width/80);
  if (i>21) {
    if (loadStrings("configuration.txt")[1].equals("darkTheme"))text("Тёмная", width/5+width/26, height/3-height/35);
    if (loadStrings("configuration.txt")[1].equals("lightTheme"))text("Cветлая", width/5+width/26, height/3-height/35);
    if (loadStrings("configuration.txt")[0].equals("transparencyON"))text("Вкл", width/5+width/20, height/4-height/17);
    if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))text("Выкл", width/5+width/22, height/4-height/17);
  }
}
public void rectStatus() {
  fill(0);
  stroke(255);
  for (int h=0; h<=600; h+=width/15-width/350)rect(width/5+width/35, height/6+height/300+h, width/15, height/30, 15);
}
public void exitSettings() {
  if (mouseX>=width/3-width/30 && mouseX<=width/3+width/22) {
    fill(0);
    stroke(100);
    if (mousePressed) {
      setupWindow();
      fill(10);
      delay(200);
      secondScreen=0;
      i=0;
    }
  } else {
    fill(10);
    stroke(0);
  }
  if (secondScreen!=0) {
    rect(width/3-width/30, 0, width/22-1, height);
    fill(255);
    textSize(height/30);
    text("<", width/3-width/50, height/2);
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "aquaponics2021_0_0_6v" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
