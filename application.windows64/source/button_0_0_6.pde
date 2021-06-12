
boolean tiles(byte number) {
  byte statusTiles=0;
  if (mouseX > sizeTilesX(number) && mouseX < sizeTilesX(number) + sizeTilesW(number) && mouseY > sizeTilesY(number) && mouseY < sizeTilesY(number) + sizeTilesH(number))statusTiles=1;
  else statusTiles=0;
  text(statusTiles, width/15, height/2+height/3);
  loadingTiles(number, statusTiles);
  if (mousePressed && statusTiles==1) return true;
  else return false;
}

int sizeTilesX(byte number){
  int i=0;
  if(number==1)i=width/15;
  if(number==2)i=width/3+width/40;
  return i;
}
int sizeTilesY(byte number){
  int i=0;
  if(number==1)i=height/15+height/7;
  if(number==2)i=height/15+height/7;
  return i;
}
int sizeTilesW(byte number){
  int i=0;
  if(number==1)i=width/3-width/20;
  if(number==2)i=width/3-width/20;
  return i;
}
int sizeTilesH(byte number){
  int i=0;
  if(number==1)i=height/4;
  if(number==2)i=height/4;
  return i;
}

void loadingTiles(byte number, int statusTiles) {
  image (loadImage("Tiles"+number+""+statusTiles+".png"), sizeTilesX(number), sizeTilesY(number));
}
