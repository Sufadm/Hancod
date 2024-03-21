import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancode_test/viewmodel/bottom_nav.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavState = ref.watch(bottomNavProvider);
    return Scaffold(
      body:
          bottomNavState.widgetOptions.elementAt(bottomNavState.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 38, 107, 41),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.values.first,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
        currentIndex: bottomNavState.selectedIndex,
        onTap: (index) {
          bottomNavState.onItemTapped(index);
        },
      ),
    );
  }
}
