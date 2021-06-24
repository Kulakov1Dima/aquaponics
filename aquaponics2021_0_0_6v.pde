byte secondScreen = 0;
boolean theme;
boolean n;
PImage transparency;
PImage pump1;
PImage pump2;
PImage pump3;
PImage pump4;
PImage pump5;
PImage pump6;
PImage pump7;
PImage pump8;

String data="no data available";


void setup() {
  transparency=loadImage("transparency.png");
  pump1=loadImage("Pump1.png");
  pump2=loadImage("Pump2.png");
  pump3=loadImage("Pump3.png");
  pump4=loadImage("Pump4.png");
  pump5=loadImage("Pump5.png");
  pump6=loadImage("Pump6.png");
  pump7=loadImage("Pump7.png");
  pump8=loadImage("Pump8.png");
  fullScreen();
  background(0);
}
void draw() {
  TileGraphics();
}

void TileGraphics() {
  if (secondScreen==0) {
    setupWindow();
  }
  pump(secondScreen);
  for (byte i=1; i<=12; i++)if (secondScreen==0)if (i!=7)if (tiles((byte)i))secondScreen=i;

  if (secondScreen==0) { 
    if (loadStrings("configuration.txt")[1].equals("darkTheme")) {
      fill(0);
    }
    if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
      fill(255);
    }
  }
  if (secondScreen==0)icons();
  definingWindows();
}

void definingWindows() { 
  if (secondScreen==1)background(255, 200, 10);
  if (secondScreen==2)background(200, 0, 0);
  if (secondScreen==3)background(0, 100, 0);
  if (secondScreen==4)background(150, 150, 150);
  if (secondScreen==5)background(56, 160, 205);
  if (secondScreen==6)background(255, 100, 0);
  if (secondScreen!=0 && secondScreen!=8 && secondScreen!=9 && secondScreen!=10 && secondScreen!=11 && secondScreen!=12)if (tiles((byte)7))secondScreen=0;
  if (secondScreen==8)panelSettings();
}
