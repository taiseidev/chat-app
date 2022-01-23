import 'package:flutter_riverpod/flutter_riverpod.dart';

final onIconTap = StateNotifierProvider(
  (ref) => ChangeBottomNavigation(0),
);

class ChangeBottomNavigation extends StateNotifier<int> {
  ChangeBottomNavigation(int state) : super(state);

  // BottomNavigationBarタップ時の挙動
  void onItemTapped(int index) {
    state = index;
  }
}
