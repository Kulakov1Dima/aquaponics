byte secondScreen = 0;
int writeData=100;
String readData="         ";

void setup() {
  //size(displayWidth, displayHeight);
  fullScreen();
  loading();
}
void draw() {
  mainWindow();
  definingWindows();
  
}
void mouseClicked(){
  pressed=true;
  delay(1);
}
