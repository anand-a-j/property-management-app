import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setCurrentIndex(int newIndex) {
    if (_index != newIndex) {
      _index = newIndex;
      notifyListeners();
    }
  }
}
