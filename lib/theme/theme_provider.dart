import 'package:dsa/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData=dark_mode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==light_mode){
      themeData=dark_mode;
    }
    else{
      themeData=light_mode;
    }
    //_themeData==light_mode?dark_mode:light_mode;
  }
}