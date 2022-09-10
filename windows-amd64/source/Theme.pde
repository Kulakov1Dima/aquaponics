void theme() {
  theme=loadStrings("configuration.txt")[1];
  if (theme.equals("darkTheme")) {
    intTheme=0;
    intThemeText=255;
  } else {
    intTheme=255;
    intThemeText=0;
  }
}
