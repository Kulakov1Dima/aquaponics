byte statusTiles;
byte modePump1=100;
boolean Pump1=true;
boolean Pump2=true;
boolean Pump3=true;
boolean Pump4=true;
boolean tiles(byte number) {
  if (mouseX > sizeTilesX(number) && mouseX < sizeTilesX(number) + sizeTilesW(number) && mouseY > sizeTilesY(number) && mouseY < sizeTilesY(number) + sizeTilesH(number))statusTiles=1;
  else statusTiles=0;
  if (secondScreen==0)loadingTiles(number, statusTiles);
  else loadingTiles((byte)7, statusTiles);
  if (mousePressed && statusTiles==1)return true;
  else return false;
}

int sizeTilesX(byte number) {
  int i=0;
  if (number==1)i=width/15;
  if (number==2)i=width/3+width/40;
  if (number==3)i=width/3+width/3-width/60;
  if (number==4)i=width/15;
  if (number==5)i=width/3+width/40;
  if (number==6)i=width/3+width/3-width/60;
  if (number==7)i=0;
  if (number==8)i=width/15;
  if (number==9)i=width/3+width/40;
  if (number==10)i=width/2+width/300;
  if (number==11)i=width/3+width/3-width/60;
  if (number==12)i=width/2+width/4+width/22;
  return i;
}
int sizeTilesY(byte number) {
  int i=0;
  if (number==1)i=height/15+height/7;
  if (number==2)i=height/15+height/7;
  if (number==3)i=height/15+height/7;
  if (number==4)i=height/3-height/250+height/7;
  if (number==5)i=height/3-height/250+height/7;
  if (number==6)i=height/3-height/250+height/7;
  if (number==7)i=0;
  if (number==8)i=height/2+height/4-height/80;
  if (number==9) i=height/2+height/4-height/80;
  if (number==10) i=height/2+height/4-height/80;
  if (number==11) i=height/2+height/4-height/80;
  if (number==12) i=height/2+height/4-height/80;
  return i;
}
int sizeTilesW(byte number) {
  int i=0;
  if (number==7)i=width/18;
  else {
    i=width/3-width/20;
    if (number==8)i=width/2-width/3-width/45;
    if (number==9)i=width/2-width/3-width/35;
    if (number==10)i=width/2-width/3-width/35;
    if (number==11)i=width/2-width/3-width/35;
    if (number==12)i=width/2-width/3-width/35;
  }
  return i;
}
int sizeTilesH(byte number) {
  int i=0;
  if (number==7)i=height;
  else {
    i=height/4;
    if (number==8)i=height/9;
    if (number==9)i=height/9;
    if (number==10)i=height/9;
    if (number==11)i=height/9;
    if (number==12)i=height/9;
  }
  return i;
}
void loadingTiles(byte number, int statusTiles) {
  if (number==7&&statusTiles==1) tint(255, 190);
  else {
    if (number==7)tint(255, 220);
    else tint(255, 255);
  }
  if (loadStrings("configuration.txt")[1].equals("darkTheme")) if (number!=9&&number!=10&&number!=11&&number!=12)image (loadImage("Tiles"+number+""+statusTiles+".png"), sizeTilesX(number), sizeTilesY(number), sizeTilesW(number), sizeTilesH(number));
  if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
    if (statusTiles==1)tint(255, 190);
    else tint(255, 220);
    if (number!=9&&number!=10&&number!=11&&number!=12)image (loadImage("Tiles"+number+".png"), sizeTilesX(number), sizeTilesY(number), sizeTilesW(number), sizeTilesH(number));
  }
}

void pump(byte mode) {
  if (mode!=modePump1) {
    if (mode==9) {
      Pump1=!Pump1;
    }
    if (mode==10) {
      Pump2=!Pump2;
    }
    if (mode==11) {
      Pump3=!Pump3;
    }
    if (mode==12) {
      Pump4=!Pump4;
    }
  }
  if (!mousePressed&& modePump1==9)secondScreen=0;
  else modePump1=mode;
  if (statusTiles==1)tint(255, 230);
  else tint(255, 250);
  if (Pump1)image(pump1, sizeTilesX((byte)9), sizeTilesY((byte)9), sizeTilesW((byte)9), sizeTilesH((byte)9));
  else image(pump2, sizeTilesX((byte)9), sizeTilesY((byte)9), sizeTilesW((byte)9), sizeTilesH((byte)9));
  if (!mousePressed&& modePump1==10)secondScreen=0;
  else modePump1=mode;
  if (statusTiles==1)tint(255, 230);
  else tint(255, 250);
  if (Pump2)image(pump3, sizeTilesX((byte)10), sizeTilesY((byte)10), sizeTilesW((byte)10), sizeTilesH((byte)10));
  else image(pump4, sizeTilesX((byte)10), sizeTilesY((byte)10), sizeTilesW((byte)10), sizeTilesH((byte)10));
  if (!mousePressed&& modePump1==11)secondScreen=0;
  else modePump1=mode;
  if (statusTiles==1)tint(255, 230);
  else tint(255, 250);
  if (Pump3)image(pump5, sizeTilesX((byte)11), sizeTilesY((byte)11), sizeTilesW((byte)11), sizeTilesH((byte)11));
  else image(pump6, sizeTilesX((byte)11), sizeTilesY((byte)11), sizeTilesW((byte)11), sizeTilesH((byte)11));
  if (!mousePressed&& modePump1==12)secondScreen=0;
  else modePump1=mode;
  if (statusTiles==1)tint(255, 230);
  else tint(255, 250);
  if (Pump4)image(pump7, sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
  else image(pump8, sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
}
