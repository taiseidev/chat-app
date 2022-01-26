import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class FirestoreAPI {
  static Future<void> setUserData(UserCredential result) async {
    final user = result.user;
    await FirebaseFirestore.instance.collection('user').add(
      {
        'uid': user!.uid,
        'name': user.displayName,
        'email': user.email,
        'iconURL': user.photoURL,
        'message': "",
      },
    );

    FirebaseFirestore.instance.collection('user').doc(user.uid).get();
  }
}
