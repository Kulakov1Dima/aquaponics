void powerButton() {
  fill(50);
  if (secondScreen==0)if (mouseX<width/5+width/90+width/7-width/300 && mouseX>width/5+width/90 && mouseY<height/2+height/4-height/80+height/9 && mouseY>height/2+height/4-height/80)
    if (secondScreen!=7){
      fill(100);
      if(mousePressed)exit();
    }
  stroke(intTheme);
  rect(width/5+width/90, height/2+height/4-height/75, width/7-width/300, height/9+height/500, 15);
  tint(255,255);
  image(power,width/4-width/130,height/2+height/4-height/80,width/14,height/9);
}
