boolean startWindow = true;
boolean n;
int in=0;
int tileTransparency=100;

PrintWriter output;
String[] textLines;
int i=0;
int k=0;

void setupWindow() {
  if (secondScreen == 12) {
    in=0;
    secondScreen = 0;
    startWindow=true;
  }
  if (startWindow)windowEffects();
  else if (load.equals("darkTheme"))background(0);
  else background(255);
  illuminationTile();
  tiles();
  if (!startWindow)icons();

  if (loadStrings("configuration.txt")[1].equals("darkTheme")) {
    fill(255);
  }
  if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
    fill(0);
  }
  if (!startWindow) {
    textSize(width/45);
    text(scanPonics, width/15, height/7+height/50);
    textSize(width/24);
    text("Aquaponics", width/2+width/10, height/10);
    fill(100, 230, 100);
    if (loadStrings("configuration.txt")[1].equals("lightTheme"))fill(20, 160, 30);
    text("Zero", width/2+width/3+width/75, height/10);
    textSize(width/42);
    text("Номер порта", width/15, height/10);
  }
}

void illuminationTile() {
  if (in>60) {
    startWindow=false;
    if (load.equals("darkTheme"))
    {
      fill(255);
      for (byte x=1; x<12; x++)rect(sizeTilesX(x)-1, sizeTilesY(x)-1, sizeTilesW(x)+1, sizeTilesH(x)+1);
    }
  }
}

void  windowEffects() {
  if (loadT) {
    in+=30;
    tint(255, 50+in);
    if (load.equals("lightTheme"))image(lightSetupWindow, 0, 0, width, height);
    else image(darkSetupWindow, 0, 0, width, height);
    tint(255, 10+in*2);
  }
}

void tiles() {
  for (byte x=1; x<13; x++) {
    if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x))tileTransparency=180;
    else tileTransparency=255;
    if (!startWindow)tint(255, tileTransparency);
    if (secondScreen==0&& x!=12) if (load.equals("lightTheme"))image(Ltiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
    else image(tiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
    else { 
      if (secondScreen!=0)if (secondScreen!=7)if (load.equals("lightTheme"))image(Ltiles[11], sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
      else image(tiles[11], sizeTilesX((byte)12), sizeTilesY((byte)12), sizeTilesW((byte)12), sizeTilesH((byte)12));
      if (secondScreen==7&& x!=12) if (load.equals("lightTheme"))image(Ltiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
      else image(tiles[x-1], sizeTilesX(x), sizeTilesY(x), sizeTilesW(x), sizeTilesH(x));
    }
  }
}

//version 0.0.6
void panelSettings() {
  if (loadStrings("configuration.txt")[0].equals("transparencyON")) {
    tint(255, 180);
    image (loadImage("rightPanel.png"), 0, 0, width/3, height);
    exitSettings();
  } else { 
    tint(255, 255);
    image (loadImage("rightPanel.png"), 0, 0, width/3, height);
    exitSettings();
  }
  buttonSettings(); 
  transparencyButton();
  themeButton();
}
void buttonSettings() {
  image (transparency, width/45, height/7-height/130, width/17, height/10-height/210);
  image (transparency, width/45, height/4-height/250, width/17, height/10-height/210);
}
void transparencyButton() {
  if (mouseX>=width/45 && mouseY>=height/7 && mouseX<=width/17+width/45 && mouseY<= height/10+height/7) {
    fill(10);
    stroke(255);
    ellipse(width/20+width/850, height/5-height/55, width/18+width/500, height/10-height/135);
    if (mousePressed) {
      n=true;
    } else {
      if (n) {
        textLines = loadStrings("configuration.txt");
        output = createWriter("data/configuration.txt"); 
        if (textLines[0].equals("transparencyON"))output.println("transparencyOFF");
        else output.println("transparencyON");
        output.println(textLines[1]);
        output.println(n);
        output.flush();
        output.close();
        n=false;
      }
    }
  }
  settingsPanel();
}
void themeButton() {
  if (mouseX>=width/45 && mouseY>=height/4 && mouseX<=width/17+width/45 && mouseY<= height/12+height/4) {
    fill(10);
    stroke(255);
    ellipse(width/20+width/850, height/3-height/25, width/18+width/510, height/10-height/135);
    if (mousePressed) {
      n=true;
      delay (100);
    } else {
      if (n) {
        textLines = loadStrings("configuration.txt");
        output = createWriter("data/configuration.txt"); 
        output.println(textLines[0]);
        if (textLines[1].equals("darkTheme"))output.println("lightTheme");
        else output.println("darkTheme");
        output.println(n);
        output.flush();
        output.close();
        n=false;
        load=loadStrings("configuration.txt")[1];
      }
    }
  }
  settingsPanel();
}
void settingsPanel() {
  rectStatus(); 
  fill(200);
  textSize(width/80);
  if (loadStrings("configuration.txt")[1].equals("darkTheme"))text("Тёмная", width/5+width/26, height/3-height/35);
  if (loadStrings("configuration.txt")[1].equals("lightTheme"))text("Cветлая", width/5+width/26, height/3-height/35);
  if (loadStrings("configuration.txt")[0].equals("transparencyON"))text("Вкл", width/5+width/20, height/4-height/17);
  if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))text("Выкл", width/5+width/22, height/4-height/17);
}
void rectStatus() {
  fill(0);
  stroke(255);
  for (int h=0; h<=600; h+=width/15-width/350)rect(width/5+width/35, height/6+height/300+h, width/15, height/30, 15);
}
void exitSettings() {
  if (mouseY<=height/10 && mouseX<=width/20) {
    fill(0);
    stroke(100);
    if (mousePressed) {
      fill(10);
      delay(200);
      secondScreen=0;
    }
  } else {
    fill(10);
    stroke(0);
  }
  if (secondScreen!=0) {
    stroke(150);
    rect(0, 0, width/20, height/10);
    fill(255);
    textSize(height/30);
    text("<", width/90, height/20);
  }
}

void icons() {
  textSize(width/25);
  if (data!="no data available") {
    if (load.equals("darkTheme"))fill(10);
    else fill(255);
    if (data.split("N").length>1)text(data.split("N")[1], width/5-width/200, height/3+height/25);
    if (data.split("N").length>2)text(data.split("N")[2], width/2-width/100, height/3+height/25);
    if (data.split("N").length>3)text(data.split("N")[3], width/2+width/4+width/50, height/3+height/25);
    if (data.split("N").length>4)text(data.split("N")[4], width/5-width/200, height/2+height/8);
    if (data.split("N").length>5)text(data.split("N")[5], width/2-width/80, height/2+height/11);
    if (data.split("N").length>6)text(data.split("N")[6], width/2-width/80, height/2+height/6);
    if (data.split("N").length>7)text(data.split("N")[7], width/2+width/4+width/50, height/2+height/8);
    textSize(width/50);
    if (data.split("N").length>8)text(data.split("N")[8], width/2-width/14, height/2+height/3-height/50);
    if (data.split("N").length>9)text(data.split("N")[9], width/2+width/13, height/2+height/3-height/50);
    if (data.split("N").length>10)text(data.split("N")[10], width/2+width/5+width/50, height/2+height/3-height/50);
    if (data.split("N").length>11)text(data.split("N")[11], width/2+width/4+width/9, height/2+height/3-height/50);
  }
}
