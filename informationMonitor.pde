String DissolvedOxygen="";
String pH="";
void information() {
  fill(intThemeText);
  if (firmwareVersion.length()>2) {
    textSize(w/37);
    text(firmwareVersion, w/2+w/3+w/85, h/5-h/30);
  }
  //if((readData.substring(1,readData.length()-1).equals(":NoData"))){
  text(readData, w/16, h-h/15);
  
  if(readData.charAt(0)=='D')DissolvedOxygen=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='H')pH=readData.substring(1,readData.length()-1);
  
  fill(255);
  textSize(w/50);
  
  text(DissolvedOxygen, w/5+w/100, h/3+h/30);
  text(pH, w/2, h/3+h/30);
  //}
}
