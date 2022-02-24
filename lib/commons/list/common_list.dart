import 'package:chatapp/commons/user/profile_image.dart';
import 'package:flutter/material.dart';

class CommonList extends StatelessWidget {
  CommonList({
    Key? key,
    this.onTap,
    this.iconURL,
    this.name,
    this.message,
  }) : super(key: key);

  VoidCallback? onTap;
  String? iconURL;
  String? name;
  String? message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          leading: UserProfileImage(
            iconUrl: iconURL,
          ),
          title: Text(
            name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            message!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
