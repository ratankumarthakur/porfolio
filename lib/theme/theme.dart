import 'package:flutter/material.dart';



ThemeData dark_mode = ThemeData(
  brightness: Brightness.dark,
  colorScheme:  ColorScheme.dark(
    //brightness: Brightness.dark,
      surface: Colors.grey.shade900,
      primary: Colors.white
        
        ));
ThemeData light_mode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      //brightness: Brightness.light,
      surface: Colors.white,
      primary: Colors.black
        
        ));
