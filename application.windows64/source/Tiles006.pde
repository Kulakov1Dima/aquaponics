byte statusTiles;
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
  return i;
}
int sizeTilesW(byte number) {
  int i=0;
  if (number==7)i=width/18;
  else {
    i=width/3-width/20;
    if (number==8)i=width/2-width/3-width/45;
  }
  return i;
}
int sizeTilesH(byte number) {
  int i=0;
  if (number==7)i=height;
  else {
    i=height/4;
    if (number==8)i=height/9;
  }
  return i;
}
void loadingTiles(byte number, int statusTiles) {
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
