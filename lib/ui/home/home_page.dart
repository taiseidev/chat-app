import 'package:chatapp/ui/home/user/user_search_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'friends/friend_list.dart';
import 'friends/friend_search_form.dart';
import 'user/user_information_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserSearchPage()),
          );
        },
      ),
    );
  }
}
