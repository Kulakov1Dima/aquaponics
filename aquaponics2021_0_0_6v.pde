byte secondScreen = 0;
boolean theme;
boolean n;
PImage transparency;

String data="no data available";


void setup() {
  transparency=loadImage("transparency.png");
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

void definingWindows() { 
  if (secondScreen==1)background(255, 200, 10);
  if (secondScreen==2)background(200, 0, 0);
  if (secondScreen==3)background(0, 100, 0);
  if (secondScreen==4)background(150, 150, 150);
  if (secondScreen==5)background(56, 160, 205);
  if (secondScreen==6)background(255, 100, 0);
  if (secondScreen!=0 && secondScreen!=8)if (tiles((byte)7))secondScreen=0;
  if (secondScreen==8)panelSettings();
}
