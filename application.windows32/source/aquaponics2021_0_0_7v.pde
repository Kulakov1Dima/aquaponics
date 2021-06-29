String data="no data available";
String writeData="H00";
String scanPonics= "Подключите ваше устройство и перезапустите программу";

byte secondScreen = 0;

void setup() {
  fullScreen();
  loading();
  if (setupRXTX()) {
    thread("rx");
    thread("tx");
  }
  thread("clickingTile");
  thread("controllButtons");
}

void draw() {
  println(data);
  setupWindow();
  definingWindows();
}
