String data="no data available";
String writeData="H00";
String scanPonics= "Подключите ваше устройство и перезапустите программу";

byte secondScreen = 0;

void setup() {
  fullScreen();
  //size(displayWidth,displayHeight);
  loading();
  thread("clickingTile");
  thread("controllButtons");
}

void draw() {
  println(data);
  setupWindow();
  definingWindows();
}
