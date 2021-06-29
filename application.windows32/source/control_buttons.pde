boolean pump[] = new boolean[4];
boolean w= false;
void controllButtons() {
  while (true) {
    for (byte x=8; x<12; x++) {
      if (mouseX>sizeTilesX(x)&&mouseY>sizeTilesY(x)&&mouseX<sizeTilesW(x)+sizeTilesX(x)&&mouseY<sizeTilesH(x)+sizeTilesY(x)) {
        if (mousePressed)w= true;
        if (w&&!mousePressed) {
          pump[x-8]=!pump[x-8];
          if (pump[x-8])writeData="M1"+(x-7);
          else writeData="M0"+(x-7);
          for(int v=0; v<=5;v++){
            serial.write(writeData);
            delay(2);
          }
          w=false;
        }
      }
    }
    delay(1);
  }
}
