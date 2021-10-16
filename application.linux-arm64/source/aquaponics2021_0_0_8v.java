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

public class aquaponics2021_0_0_8v extends PApplet {

byte secondScreen = 0;
int writeData=100;
String readData="         ";

public void setup() {
  //size(displayWidth, displayHeight);
  
  loading();
}
public void draw() {
  mainWindow();
  definingWindows();
  
}
public void mouseClicked(){
  pressed=true;
  delay(1);
}

Serial serial;

String scanPonics= "Подключите ваше устройство и перезапустите программу";
String firmwareVersion="";

public void setupRXTX() {
  if (Serial.list().length>0) {
    for (int port=Serial.list().length-1; port>=0; port--)
     if (Serial.list()[port].substring(0, Serial.list()[port].length()-1).equals("/dev/ttyACM")||Serial.list()[port].substring(0, Serial.list()[port].length()-1).equals("COM")) {
        scanPonics =Serial.list()[port];
        serial = new Serial(this, Serial.list()[port], 250000);
        thread("rx");
        thread("tx");
        port=0;
      }
  }
}

public void rx() {
  while (true) {
    String received=" ";
    if ( serial.available() > 0) {
      received = serial.readStringUntil('\n');
      if (received != null) {
        received=received.replaceAll("\n", "");
        received=received.replaceAll(" ", "");
        readData=received;
        if(readData.charAt(0)=='V')firmwareVersion=readData.substring(1,readData.length()-1);
      }
    }
    delay(1);
  }
}
public void tx() {
  while (true) {
    serial.write(writeData);
    delay(1000) ;
  }
}
public void powerButton() {
  fill(50);
  if (secondScreen==0)if (mouseX<width/5+width/90+width/7-width/300 && mouseX>width/5+width/90 && mouseY<height/2+height/4-height/80+height/9 && mouseY>height/2+height/4-height/80)
    if (secondScreen!=7){
      fill(100);
      if(mousePressed)exit();
    }
  stroke(intTheme);
  rect(width/5+width/90, height/2+height/4-height/75, width/7-width/300, height/9+height/500, 15);
  tint(255,255);
  image(power,width/4-width/130,height/2+height/4-height/80,width/14,height/9);
}
public void dissolvedOxygen() {
  background(255, 200, 10);
  fill(0);
  textSize(height/12);
  text("Растворённый кислород", width/8-width/100, height/12);
}

public void pH() {
  background(245, 20, 20);
  fill(0);
  textSize(height/12);
  text("PH среда", width/8-width/100, height/12);
}

public void eC() {
  background(0, 100, 0);
  fill(0);
  textSize(height/12);
  text("Проводимость", width/8-width/100, height/12);
}

public void temperature() {
  background(150, 150, 150); 
  fill(0);
  textSize(height/12);
  text("Температура", width/8-width/100, height/12);
}

public void flow(){
  background(56, 160, 205);
  fill(0);
  textSize(height/12);
  text("Поток", width/8-width/100, height/12);
}

public void orp(){
  background(255, 100, 0);
  fill(0);
  textSize(height/16);
  text("Окислительно-восстановительный потенциал", width/8-width/100, height/12);
  
}
public void theme() {
  theme=loadStrings("configuration.txt")[1];
  if (theme.equals("darkTheme")) {
    intTheme=0;
    intThemeText=255;
  } else {
    intTheme=255;
    intThemeText=0;
  }
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

public void tiles() {
  fill(255);
  stroke(255);
  tint(255, 222);
  for (byte x=1; x<12; x++) {
    if (secondScreen!=7)if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x)) {
      rect(sizeTilesX(x), sizeTilesY(x), sizeTilesW(x)-3, sizeTilesH(x)-3,20);
      tint(255, 120);
    } else tint(255, 222);
    image(tiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
  }
}
public void exitTile() {
  byte x=12;
  if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x)) {
    rect(sizeTilesX(x)-1, sizeTilesY(x)-1, sizeTilesW(x)+1, sizeTilesH(x)+1);
    tint(255, 120);
  } else tint(255, 240);
  fill(255);
  rect(sizeTilesX(x)-1, sizeTilesY(x)-1, sizeTilesW(x), sizeTilesH(x)+1);
  image(tiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
  tint(255, 255);
}
public void mainWindow() {
  background(intTheme);
  if (background.equals("backgroundON")) {
    tint(255, 220);
    image(themeImage, 0, 0, w, h);
  }
  fill(intThemeText);
  textSize(h/20);
  text(scanPonics, w/15, h/7+h/50);
  textSize(w/23);
  text("Aquaponics", w/2+w/11, h/10);
  fill(100, 230, 100);
  if (theme.equals("lightTheme"))fill(0, 140, 18);
  text("Zero", w/2+w/3+w/100, h/10);
  textSize(w/35);
  text("Номер порта", w/15, h/10);
  tiles();
  information();
  powerButton();
  if (secondScreen==7)rightPanel();
}


public void tileClicks() {
  while (true) {
    if (secondScreen==0||(secondScreen<12 && secondScreen>7)) {
      for (byte x=1; x<13; x++)
        if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x))
          if (mousePressed)secondScreen=x;
      if (secondScreen==12)secondScreen=0;
    } else {
      byte x=12;
      if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x))if (mousePressed)secondScreen=0;
    }
    delay(1);
  }
}

public void definingWindows() {
  if (secondScreen==1)dissolvedOxygen();
  if (secondScreen==2)pH();
  if (secondScreen==3)eC();
  if (secondScreen==4)temperature();
  if (secondScreen==5)flow();
  if (secondScreen==6)orp();
  if (secondScreen>0 && secondScreen<8) {
    exitTile();
    if (secondScreen!=7)chartWindow();
  }
}

public void tileClicksPump() {
  while (true) {
    if (secondScreen==0)for (byte x=8; x<12; x++)
      if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x))
        if (mousePressed)secondScreen=x;
    if (secondScreen==8) {
      writeData=8;
    }
    if (secondScreen==9) {
      writeData=9;
    }
    if (secondScreen==10) {
      writeData=10;
    }
    if (secondScreen==11) {
      writeData=11;
    }
    if (secondScreen==0) {
      writeData=200;
    }
    delay(1);
  }
}

public void chartWindow() {
  fill(20);
  stroke(20);
  for (int i=0; i<10; i++)rect(width/8+(width/20*i), height/6, width/38, height/2-height/50, 100);
}
String DissolvedOxygen="";
String pH="";
String eC="";
String t="";
String orp="";
public void information() {
  fill(intThemeText);
  if (firmwareVersion.length()>2) {
    textSize(w/30);
    text(firmwareVersion, w/2+w/3+w/85, h/5-h/30);
  }
  //if((readData.substring(1,readData.length()-1).equals(":NoData"))){
  text(readData, w/16, h-h/15);
  
  if(readData.charAt(0)=='D')DissolvedOxygen=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='H')pH=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='E')eC=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='T')t=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='O')orp=readData.substring(1,readData.length()-1);
  fill(intTheme);
  textSize(w/45);
  
  text(DissolvedOxygen, w/5+w/100, h/3+h/27);
  text(pH, w/2, h/3+h/27);
  text(eC, w/2+w/4+w/30, h/3+h/27);
  text(t, w/5+w/100, h/2+h/8);
  text(orp, w/2+w/4+w/30, h/2+h/8);
}
String theme;
String background;
int intTheme;
int intThemeText;
int w=0;
int h=0;
boolean startArduino = true;

PImage tiles[] = new PImage[12];
PImage rightPanel;
PImage themeButton;
PImage themebackground;
PImage power;
PImage themeImage;

public void loading() {
  theme();
  setupWindow();
  //delay(1000);
  if (startArduino)thread("setupRXTX");
  startArduino=false;
  thread("tileClicks");
  background=loadStrings("configuration.txt")[2];
  loadImage();
  textLines = loadStrings("configuration.txt");
  thread("tileClicksPump");
}

public void setupWindow() {
  background(intTheme);
  fill(intThemeText);
  w=width;
  h=height;
  textSize(w/15);
  text("Loading...", w/2-w/7, h/2);
  textSize(w/50);
  text("Aquaponics 0.0.8", w/2-w/12, h-h/10);
}

public void loadImage() {
  themeImage= loadImage ("grass.png");
  if (theme.equals("darkTheme"))for (byte x=0; x<12; x++)tiles[x]= loadImage ("Tiles"+(int)(x+1)+".png");
  else for (byte x=0; x<12; x++)tiles[x]= loadImage ("LTiles"+(int)(x+1)+".png");
  rightPanel=loadImage("rightPanel.png");
  if (theme.equals("darkTheme"))themeButton = loadImage("themeL.png");
  else themeButton = loadImage("themeD.png");
  if (theme.equals("darkTheme"))themebackground = loadImage("backgroundpicture.jpg");
  else themebackground = loadImage("backgroundpictureL.jpg");
  
  power=loadImage("power.png");
}
PrintWriter output;
String[] textLines;
boolean pressed;

public void rightPanel() {
  tint(255, 150);
  image(rightPanel, 0, 0, width/3, height);
  tint(160, 255);
  if (theme.equals("darkTheme"))fill(250);
  else fill(20);
  if (mouseX>width/14 && mouseY>height/16 && mouseX<width/14+width/9 && mouseY<height/16+height/9) {
    stroke(255);
    if (mousePressed)if (pressed) {
      secondScreen=0;
      output = createWriter("data/configuration.txt");
      output.println(textLines[0]);
      if (textLines[1].equals("darkTheme"))output.println("lightTheme");
      else output.println("darkTheme");
      output.println(textLines[2]);
      output.flush();
      output.close();
      loading();
      pressed=false;
      delay(1);
    }
  } else stroke(20);
  rect(width/14, height/16, width/9, height/9, 25);
  if (mouseX>width/5 && mouseY>height/16 && mouseX<width/5+width/9 && mouseY<height/16+height/9) {
    stroke(255);
    if (mousePressed)if (pressed) {
      secondScreen=0;
      output = createWriter("data/configuration.txt");
      output.println(textLines[0]);
      output.println(textLines[1]);
      if (textLines[2].equals("backgroundON"))output.println("backgroundOFF");
      else output.println("backgroundON");
      output.flush();
      output.close();
      loading();
      pressed=false;
      delay(1);
    }
  } else stroke(20);
  rect(width/5, height/16, width/9, height/9, 25);
  tint(255, 255);
  image(themeButton, width/9-width/90, height/15, width/21, height/13);
  image(themebackground, width/4-width/50, height/15, width/21, height/12-height/200);
  textSize(width/80);
  if (theme.equals("darkTheme"))fill(0);
  else fill(255);
  text("Тема", width/10+width/90, height/6);
  text("Фон", width/10+width/7, height/6);
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "aquaponics2021_0_0_8v" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
