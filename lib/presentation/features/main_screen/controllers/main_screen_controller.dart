import 'package:flutter/material.dart';

class MainScreenController with ChangeNotifier {
  int currentScreenIndex = 0;

  void changeCurrentScreenIndex(int index) {
    if (currentScreenIndex != index) {
      currentScreenIndex = index;
      notifyListeners();
    }
  }
}
