import 'package:chatapp/ui/home/user/user_search_page.dart';
import 'package:flutter/material.dart';
import 'friends/friend_list.dart';
import 'friends/friend_search_form.dart';
import 'user/user_information_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(context));
  }

  Widget _buildBody() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const UserInformation(),
            FriendSearchForm(),
          ],
        ),
        FriendList(),
      ],
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[700],
      child: const Icon(Icons.search),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserSearchPage()),
        );
      },
    );
  }
}
