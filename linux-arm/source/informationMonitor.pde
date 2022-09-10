String DissolvedOxygen="";
String pH="";
String eC="";
String t="";
String orp="";
void information() {
  fill(intThemeText);
  if (firmwareVersion.length()>2) {
    textSize(w/30);
    text(firmwareVersion, w/2+w/3+w/85, h/5-h/30);
  }
  //if((readData.substring(1,readData.length()-1).equals(":NoData"))){
  text(readData, w/16, h-h/15);
  
  if(readData.charAt(0)=='D')DissolvedOxygen=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='H')pH=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='E')eC=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='T')t=readData.substring(1,readData.length()-1);
  if(readData.charAt(0)=='O')orp=readData.substring(1,readData.length()-1);
  fill(intTheme);
  textSize(w/45);
  
  text(DissolvedOxygen, w/5+w/100, h/3+h/27);
  text(pH, w/2, h/3+h/27);
  text(eC, w/2+w/4+w/30, h/3+h/27);
  text(t, w/5+w/100, h/2+h/8);
  text(orp, w/2+w/4+w/30, h/2+h/8);
}
