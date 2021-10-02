void mainWindow() {
  background(intTheme);
  fill(intThemeText);
  textSize(w/45);
  text(scanPonics, w/15, h/7+h/50);
  textSize(w/24);
  text("Aquaponics", w/2+w/10, h/10);
  fill(100, 230, 100);
  if (theme.equals("lightTheme"))fill(0, 140, 18);
  text("Zero", w/2+w/3+w/100, h/10);
  textSize(w/37);
  text("Номер порта", w/15, h/10);
  tiles();
  information();
  powerButton();
  if (secondScreen==7)rightPanel();
  
}


void tileClicks() {
  while (true) {
    if (secondScreen!=7) {
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

void definingWindows() { 
  if (secondScreen==1)dissolvedOxygen();
  if (secondScreen==2)pH();
  if (secondScreen==3)eC();
  if (secondScreen==4)temperature();
  if (secondScreen==5)flow();
  if (secondScreen==6)orp();
  if (secondScreen>0 && secondScreen<8){
    exitTile();
    if (secondScreen!=7)chartWindow();
  }
}

void tileClicksPump() {
  while (true) {
    if (secondScreen!=7) {
      for (byte x=8; x<12; x++)
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
      if (secondScreen==11)writeData=11;
      if (secondScreen==0)writeData=200;
    }
    delay(1);
  }
}

void chartWindow(){
  fill(20);
  stroke(20);
  for(int i=0; i<10; i++)rect(width/8+(width/20*i),height/6,width/38,height/2-height/50,100);
}
