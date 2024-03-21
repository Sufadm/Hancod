import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancode_test/view/bottomnav/bookings.dart';
import 'package:hancode_test/view/profile/profile_page.dart';
import 'package:hancode_test/view/home/home_page.dart';

class BottomNavState extends ChangeNotifier {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const BookingsPage(),
    const ProfilePage(),
  ];

  int get selectedIndex => _selectedIndex;
  List<Widget> get widgetOptions => _widgetOptions;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

final bottomNavProvider = ChangeNotifierProvider<BottomNavState>((ref) {
  return BottomNavState();
});
