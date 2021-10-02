int sizeTilesX(byte number) {
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
int sizeTilesY(byte number) {
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
int sizeTilesW(byte number) {
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
int sizeTilesH(byte number) {
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

void tiles() {
  fill(255);
  stroke(255);
  tint(255, 210);
  for (byte x=1; x<12; x++) {
    if (secondScreen!=7)if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x)) {
      rect(sizeTilesX(x), sizeTilesY(x), sizeTilesW(x)-3, sizeTilesH(x)-3,20);
      tint(255, 120);
    } else tint(255, 210);
    image(tiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
  }
}
void exitTile() {
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
