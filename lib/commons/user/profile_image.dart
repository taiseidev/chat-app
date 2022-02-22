import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  UserProfileImage({
    Key? key,
    this.radius,
    this.iconUrl,
  }) : super(key: key);

  String? iconUrl;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return iconUrl != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(iconUrl!),
            radius: radius,
          )
        : CircleAvatar(
            child: const Icon(Icons.person),
            radius: radius,
          );
  }
}
