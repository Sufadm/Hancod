import 'package:flutter/material.dart';

class ServiceSelectionModel extends ChangeNotifier {
  int selectedIndex = 1;

  void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
