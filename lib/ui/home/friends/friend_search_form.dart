import 'package:flutter/material.dart';

class FriendSearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.grey, //色
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '検索',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
