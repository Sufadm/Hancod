import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  late Timer _timer;
  late int _secondsRemaining;

  int get secondsRemaining => _secondsRemaining;

  TimerProvider({int countdownSeconds = 60}) {
    _secondsRemaining = countdownSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  void resetTimer() {
    _secondsRemaining = 60; // Reset timer to initial value
    notifyListeners();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
