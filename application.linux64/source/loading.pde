PImage darkSetupWindow;
PImage lightSetupWindow;
PImage tiles[] = new PImage[12];
PImage Ltiles[] = new PImage[12];
PImage transparency;
String load;
boolean loadT= false;

void loading() {
  loadingScreen();
  setupRXTX();
  darkSetupWindow = loadImage ("darkSetupWindow.png");
  lightSetupWindow =loadImage ("lightSetupWindow.png");
  for (byte x=0; x<12; x++)tiles[x]= loadImage ("Tiles"+(int)(x+1)+".png");
  for (byte x=0; x<12; x++)Ltiles[x]= loadImage ("LTiles"+(int)(x+1)+".png");
  transparency=loadImage("transparency.png");
  loadT=true;
}

void loadingScreen() {
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
