import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  final List<int> _counters = List.filled(7, 0);

  int getCounter(int index) {
    return _counters[index];
  }

  void increment(int index) {
    _counters[index]++;
    notifyListeners();
  }

  void decrement(int index) {
    if (_counters[index] > 0) {
      _counters[index]--;
      notifyListeners();
    }
  }
}
