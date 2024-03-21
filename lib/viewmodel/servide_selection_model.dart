import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceSelectionModel extends ChangeNotifier {
  int selectedIndex = 0;

  void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

final provider = ChangeNotifierProvider<ServiceSelectionModel>((
  ref,
) {
  return ServiceSelectionModel();
});
