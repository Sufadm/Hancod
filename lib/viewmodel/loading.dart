import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}

final myNotifierProvider = ChangeNotifierProvider<LoadingProvider>((ref) {
  return LoadingProvider();
});
