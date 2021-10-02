String theme;
int intTheme;
int intThemeText;
int w=0;
int h=0;
boolean startArduino = true;

PImage tiles[] = new PImage[12];
PImage rightPanel;
PImage themeButton;
PImage power;

void loading() {
  theme();
  setupWindow();
  //delay(1000);
  if(startArduino)thread("setupRXTX");
  startArduino=false;
  thread("tileClicks");
  loadImage();
  textLines = loadStrings("configuration.txt");
  thread("tileClicksPump");
  
}

void setupWindow() {
  background(intTheme);
  fill(intThemeText);
  w=width;
  h=height;
  textSize(w/15);
  text("Loading...", w/2-w/7, h/2);
  textSize(w/50);
  text("Aquaponics 0.0.8", w/2-w/12, h-h/10);
}

void loadImage() {
  if (theme.equals("darkTheme"))for (byte x=0; x<12; x++)tiles[x]= loadImage ("Tiles"+(int)(x+1)+".png");
  else for (byte x=0; x<12; x++)tiles[x]= loadImage ("LTiles"+(int)(x+1)+".png");
  rightPanel=loadImage("rightPanel.png");
  if (theme.equals("darkTheme"))themeButton = loadImage("themeL.png");
  else themeButton = loadImage("themeD.png");
  power=loadImage("power.png");
}
