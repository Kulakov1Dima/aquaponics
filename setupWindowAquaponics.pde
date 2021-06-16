PrintWriter output;
String[] textLines;
int i=0;
int k=0;
boolean drawButton=false;
void setupWindow() {
  if (loadStrings("configuration.txt")[1].equals("darkTheme")) {
    background(0);
    fill(255);
  }
  if (loadStrings("configuration.txt")[1].equals("lightTheme")) {
    background(255);
    fill(0);
  }
  textSize(width/45);
  text(scanPonics(), width/15, height/7+height/50);
  if (portTime==0)if (port.length!=0) {
    serial = new Serial(this, scanPonics(), 9600);
    delay(1500);

    //while( serial.available()==0)serial.write("ok");
    if ( serial.available() > 0) {
      received = serial.readStringUntil('\n');
      writeData=111;
      thread("requestData");
    }
    if (received.split("!").length>1)text(received.split("!")[1], width/2+width/6-width/70, height/7+height/100);
    //if (data.length()!=0)text(data.split("N")[0], width/15, height/2+height/3);
    portTime=1;
    if (data.length()!=0)println(data);
  }

  textSize(width/24);
  text("Aquaponics", width/2+width/10, height/10);
  fill(100, 230, 100);
  if (loadStrings("configuration.txt")[1].equals("lightTheme"))fill(20, 160, 30);
  text("Zero", width/2+width/3+width/75, height/10);
  textSize(width/42);
  text("Имя порта вашего устройства:", width/15, height/10);
}

void panelSettings() {
  i+=2;
  if (loadStrings("configuration.txt")[0].equals("transparencyON")) {
    tint(255, 40);
    if (i<22 && secondScreen!=0)image (loadImage("rightPanel.png"), 0, 0, width/3+width/100, height);
    else exitSettings();
  } else { 
    tint(255, 255);
    image (loadImage("rightPanel.png"), 0, 0, width/3+width/100, height);
    exitSettings();
  }
  if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))buttonSettings(); 
  else if (i>10) buttonSettings();
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
      delay (100);
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
      }
    }
  }
  settingsPanel();
}
void settingsPanel() {
  if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))rectStatus(); 
  else if (i>21)rectStatus();
  fill(200);
  textSize(width/80);
  if (i>21) {
    if (loadStrings("configuration.txt")[1].equals("darkTheme"))text("Тёмная", width/5+width/26, height/3-height/35);
    if (loadStrings("configuration.txt")[1].equals("lightTheme"))text("Cветлая", width/5+width/26, height/3-height/35);
    if (loadStrings("configuration.txt")[0].equals("transparencyON"))text("Вкл", width/5+width/20, height/4-height/17);
    if (loadStrings("configuration.txt")[0].equals("transparencyOFF"))text("Выкл", width/5+width/22, height/4-height/17);
  }
}
void rectStatus() {
  fill(0);
  stroke(255);
  for (int h=0; h<=600; h+=width/15-width/350)rect(width/5+width/35, height/6+height/300+h, width/15, height/30, 15);
}
void exitSettings() {
  if (mouseX>=width/3-width/30 && mouseX<=width/3+width/22) {
    fill(0);
    stroke(100);
    if (mousePressed) {
      setupWindow();
      fill(10);
      delay(200);
      secondScreen=0;
      i=0;
    }
  } else {
    fill(10);
    stroke(0);
  }
  if (secondScreen!=0) {
    rect(width/3-width/30, 0, width/22-1, height);
    fill(255);
    textSize(height/30);
    text("<", width/3-width/50, height/2);
  }
}
