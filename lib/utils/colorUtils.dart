import 'package:flutter/material.dart';

class ColorUtils{
  

  
 static Color sysColorBag(BuildContext context) {

   return Theme.of(context).colorScheme.brightness == Brightness.dark?Color.fromARGB(48,48,48,48):Colors.white;
}


  //适用于字体
  static Color sysColorText(BuildContext context) {
    
  return Theme.of(context).colorScheme.brightness == Brightness.dark?Colors.white:Colors.black;
}

}