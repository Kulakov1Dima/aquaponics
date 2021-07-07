void clickingTile() {
  while (true) {
    for (byte x=1; x<8; x++) {
      if (secondScreen==0)if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x)&&mousePressed)secondScreen=x;
      if (secondScreen!=0)if (secondScreen!=7)if (mouseX>sizeTilesX((byte)12)&&mouseY>sizeTilesY((byte)12)&&mouseX<sizeTilesW((byte)12)+sizeTilesX((byte)12)&&mouseY<sizeTilesH((byte)12)+sizeTilesY((byte)12)&&mousePressed)
        if (loadStrings("configuration.txt")[0].equals("transparencyON"))secondScreen=12;
        else secondScreen=0;
    }
  }
}
void definingWindows() { 
  if (secondScreen==1)background(255, 200, 10);
  if (secondScreen==2)background(200, 0, 0);
  if (secondScreen==3)background(0, 100, 0);
  if (secondScreen==4)background(150, 150, 150);
  if (secondScreen==5)background(56, 160, 205);
  if (secondScreen==6)background(255, 100, 0);
  if (secondScreen!=0 && secondScreen!=8 && secondScreen!=9 && secondScreen!=10 && secondScreen!=11 && secondScreen!=7) {
    if (secondScreen!=12) {
      fill(255);
      rect(sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
      if (mouseX>sizeTilesX((byte)12)&&mouseY>sizeTilesY((byte)12)&&mouseX<sizeTilesW((byte)12)+sizeTilesX((byte)12)&&mouseY<sizeTilesH((byte)12)+sizeTilesY((byte)12))tileTransparency=170;
      else tileTransparency=225;
      tint(tileTransparency);
      image(tiles[11], sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
    }
  }
  if (secondScreen==7)panelSettings();
}
