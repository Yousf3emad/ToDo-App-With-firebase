import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    getThemeInit();
  }

  bool isDark = false;

  void setIsDark(bool isDark) async {
    this.isDark = isDark;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDark", this.isDark);
    notifyListeners();
  }

  getThemeInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     isDark = sharedPreferences.getBool("isDark") ?? false;
    notifyListeners();
  }

}
