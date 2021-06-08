void icons() {
  textSize(width/50);
  fill(0);
  image (temperature, width/13, height/2+height/40, width/12, height/7);
  text("Temperature", width/6+width/60, height/2+height/70);
  image (dissolvedOxygen, width/14, height/4, width/10-width/200, height/7+height/50);
  text("Dissolved Oxygen", width/6, height/4+height/200);
  image (pH, width/2-width/8-width/110, height/4, width/10-width/170, height/7+height/50);
  text("pH", width/2, height/4+height/200);
}
