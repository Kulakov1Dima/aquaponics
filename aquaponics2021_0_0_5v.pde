MyButton btn1=new MyButton();
MyButton btn2=new MyButton();
MyButton btn3=new MyButton();
MyButton btn4=new MyButton();
MyButton btn5=new MyButton();
MyButton btn6=new MyButton();
MyButton btn7=new MyButton();

PImage temperature;
PImage dissolvedOxygen;
PImage pH;
PImage Conductivity;

byte secondScreen =0;

void setup() {
  temperature = loadImage("b45f8e4366b41a30994d6b5b3bb2d51b.png");
  dissolvedOxygen = loadImage("Растворенный кислород.png");
  pH = loadImage("pH.png");
  Conductivity=loadImage("Conductivity.png");
  background(0);
  fullScreen();
  button1(width/15, height/15+height/7, width/3-width/20, height/4, 255, 200, 0);
  button2(width/3+width/40, height/15+height/7, width/3-width/20, height/4, 200, 0, 0);
  button3(width/3+width/3-width/60, height/15+height/7, width/3-width/20, height/4, 0, 100, 0);
  button4(width/15, height/3-height/250+height/7, width/3-width/20, height/4, 150, 150, 150);
  button5(width/3+width/40, height/3-height/250+height/7, width/3-width/20, height/4, 56, 160, 205);
  button6(width/3+width/3-width/60, height/3-height/250+height/7, width/3-width/20, height/4, 255, 100, 0);
  button7(0, 0, width/20, height/20, 0, 0, 0, " <");
}

void draw() {
  if (secondScreen==0)setupWindow();
  if (secondScreen==0)if (btn1.ButtonDraw()) button1();
  if (secondScreen==0)if (btn2.ButtonDraw()) button2();
  if (secondScreen==0)if (btn3.ButtonDraw()) button3();
  if (secondScreen==0)if (btn4.ButtonDraw()) button4();
  if (secondScreen==0)if (btn5.ButtonDraw()) button5();
  if (secondScreen==0)if (btn6.ButtonDraw()) button6();
  if (secondScreen==1)button1();
  if (secondScreen==2)button2();
  if (secondScreen==3)button3();
  if (secondScreen==4)button4();
  if (secondScreen==5)button5();
  if (secondScreen==6)button6();
  if (secondScreen==0) {
    icons();
    writeData=111;
  }
}
void button1() {
  secondScreen=1;
  background(255, 200, 10);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=2000;
}
void button2() {
  secondScreen=2;
  fill(200, 0, 0);
  rect(0, 0, width, height);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=3000;
}
void button3() {
  secondScreen=3;
  background(0, 100, 0);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=4000;
}
void button4() {
  secondScreen=4;
  background(150, 150, 150);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=100;
}
void button5() {
  secondScreen=5;
  background(56, 160, 205);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=500;
}
void button6() {
  secondScreen=6;
  background(255, 100, 0);
  if (btn7.ButtonDraw())secondScreen=0;
  writeData=5000;
}
