PrintWriter output;
String[] textLines;
boolean pressed;

void rightPanel() {
  tint(255, 150);
  image(rightPanel, 0, 0, width/3, height);
  tint(160, 255);
  if (theme.equals("darkTheme"))fill(250);
  else fill(20);
  if (mouseX>width/14 && mouseY>height/16 && mouseX<width/14+width/9 && mouseY<height/16+height/9) {
    stroke(255);
    if (mousePressed)if (pressed) {
      secondScreen=0;
      output = createWriter("data/configuration.txt");
      output.println(textLines[0]);
      if (textLines[1].equals("darkTheme"))output.println("lightTheme");
      else output.println("darkTheme");
      output.println(textLines[2]);
      output.flush();
      output.close();
      loading();
      pressed=false;
      delay(1);
    }
  } else stroke(20);
  rect(width/14, height/16, width/9, height/9, 25);
  if (mouseX>width/5 && mouseY>height/16 && mouseX<width/5+width/9 && mouseY<height/16+height/9) {
    stroke(255);
    if (mousePressed)if (pressed) {
      secondScreen=0;
      output = createWriter("data/configuration.txt");
      output.println(textLines[0]);
      output.println(textLines[1]);
      if (textLines[2].equals("backgroundON"))output.println("backgroundOFF");
      else output.println("backgroundON");
      output.flush();
      output.close();
      loading();
      pressed=false;
      delay(1);
    }
  } else stroke(20);
  rect(width/5, height/16, width/9, height/9, 25);
  tint(255, 255);
  image(themeButton, width/9-width/90, height/15, width/21, height/13);
  image(themebackground, width/4-width/50, height/15, width/21, height/12-height/200);
  textSize(width/80);
  if (theme.equals("darkTheme"))fill(0);
  else fill(255);
  text("Тема", width/10+width/90, height/6);
  text("Фон", width/10+width/7, height/6);
}
