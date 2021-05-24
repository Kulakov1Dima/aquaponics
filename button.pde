void button1(float x,float y,float w,float h,int r,int g,int b){
  btn1.x=x;
  btn1.y=y;
  btn1.w=w;
  btn1.h=h;
  btn1.btnColor=color(r,g,b);
  btn1.btnRollOver=color(r,g+20,b);
}
void button2(float x,float y,float w,float h,int r,int g,int b){
  btn2.x=x;
  btn2.y=y;
  btn2.w=w;
  btn2.h=h;
  btn2.btnColor=color(r,g,b);
  btn2.btnRollOver=color(r+20,g+20,b+20);
}
void button3(float x,float y,float w,float h,int r,int g,int b){
  btn3.x=x;
  btn3.y=y;
  btn3.w=w;
  btn3.h=h;
  btn3.btnColor=color(r,g,b);
  btn3.btnRollOver=color(r+20,g+20,b+20);
}
void button4(float x,float y,float w,float h,int r,int g,int b){
  btn4.x=x;
  btn4.y=y;
  btn4.w=w;
  btn4.h=h;
  btn4.btnColor=color(r,g,b);
  btn4.btnRollOver=color(r+20,g+20,b+20);
}
void button5(float x,float y,float w,float h,int r,int g,int b){
  btn5.x=x;
  btn5.y=y;
  btn5.w=w;
  btn5.h=h;
  btn5.btnColor=color(r,g,b);
  btn5.btnRollOver=color(r+20,g+20,b+20);
}
void button6(float x,float y,float w,float h,int r,int g,int b){
  btn6.x=x;
  btn6.y=y;
  btn6.w=w;
  btn6.h=h;
  btn6.btnColor=color(r,g,b);
  btn6.btnRollOver=color(r+30,g+30,b+30);
}
void button7(float x,float y,float w,float h,int r,int g,int b, String s){
  btn7.x=x;
  btn7.y=y;
  btn7.w=w;
  btn7.h=h;
  btn7.btnColor=color(r,g,b);
  btn7.btnRollOver=color(r+30,g+30,b+30);
  btn7.label=s;
  btn7.txColor=255;
}

class MyButton{

float x;
float y;
float w;
float h;

int u=0;

color btnColor=color(0);
color btnRollOver=color(0);

String label="";
float lX=20;
float lY=30;
int ts=25;
color txColor=color(0);

boolean btnClicked=false;

boolean ButtonDraw(){

noStroke();
fill(0,0,0,75);
rect(x+3,y+5,w+3,h+3,u);

stroke(1);

if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {

fill(btnRollOver);

if (mousePressed){btnClicked=true; }
else {btnClicked=false;}

} else {
fill(btnColor);
btnClicked=false;
}
rect(x,y,w,h,u);
fill(txColor);
textSize(ts);
text(label,x+lX,y+lY);

return btnClicked;

}

}
