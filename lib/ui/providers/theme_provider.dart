import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// to change the theme of the app
// make the theme provider class
class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light; //initialize the theme
  set newTheme(ThemeMode themeMode) {
    currentTheme = themeMode; // change the current theme
    notifyListeners(); // to make all the screens rebuild it self
  }
}
