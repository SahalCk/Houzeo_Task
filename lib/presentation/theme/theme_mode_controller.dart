import 'package:flutter/material.dart';
import 'package:houzeo_app/presentation/theme/houzeo_theme.dart';

class ThemeModeController with ChangeNotifier {
  ThemeData _themeData = HouzeoAppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  void changeTheme() {
    if (_themeData == HouzeoAppTheme.lightTheme) {
      _themeData = HouzeoAppTheme.darkTheme;
    } else {
      _themeData = HouzeoAppTheme.lightTheme;
    }
    notifyListeners();
  }
}
