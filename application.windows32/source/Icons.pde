void icons() {
  textSize(width/50);
  fill(0);

  image (dissolvedOxygen, width/14, height/4, width/10-width/200, height/7+height/50);
  text("Dissolved Oxygen", width/6, height/4+height/200);
  text("mg/L", width/4+width/25, height/3+height/25);

  image (pH, width/2-width/8-width/110, height/4, width/10-width/170, height/7+height/50);
  text("pH", width/2, height/4+height/200);

  image(Conductivity, width/2+width/6, height/4-height/100, width/10-width/170, height/7+height/50);
  text("EC", width/2+width/3, height/4+height/200);
  text("uS", width/2+width/3+width/25, height/3+height/25);

  image (temperature, width/13, height/2+height/40, width/12, height/7);
  text("Temperature", width/6+width/60, height/2+height/70);
  text("C°", width/4+width/20, height/2+height/8);

  image (pump, width/2-width/8-width/110, height/2+height/40, width/10, height/7);
  text("Pump", width/2, height/2+height/70);
  text("ml", width/2+width/10, height/2+height/8);
  
  image(co2, width/2+width/7+width/150, height/3+height/6-height/150, width/9-width/200, height/7+height/20);
  text("CO2", width/2+width/3, height/2+height/70);
  text("ppm", width/2+width/3+width/25, height/2+height/8);

  textSize(width/25);
  if (data!="no data available") {
    if (data.split("N").length>1)text(data.split("N")[1], width/5-width/200, height/3+height/25);
    if (data.split("N").length>2)text(data.split("N")[2], width/2-width/100, height/3+height/25);
    if (data.split("N").length>3)text(data.split("N")[3], width/2+width/4+width/50, height/3+height/25);
    if (data.split("N").length>4)text(data.split("N")[4], width/5-width/200, height/2+height/8);
    if (data.split("N").length>5)text(data.split("N")[5], width/2-width/100, height/2+height/8);
  }
}
