import 'package:chatapp/provider/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chat/chat_page.dart';
import 'home/home_page.dart';
import 'setting_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Body(),
      bottomNavigationBar: const BottomNabigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Chat App',
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }
}

class Body extends ConsumerWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onIconTap);
    final bottomIndex = state as int;
    return _changeBody(bottomIndex);
  }

  Widget _changeBody(int bottomIndex) {
    if (bottomIndex == 0) {
      return HomePage();
    } else if (bottomIndex == 1) {
      return ChatPage();
    } else if (bottomIndex == 2) {
      return SettingPage();
    }
    return Container();
  }
}

class BottomNabigationBar extends ConsumerWidget {
  const BottomNabigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onIconTap);
    final notifier = ref.watch(onIconTap.notifier);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'チャット',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ],
      currentIndex: state as int,
      onTap: (index) {
        notifier.onItemTapped(index);
      },
    );
  }
}
