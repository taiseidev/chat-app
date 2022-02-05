import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreAPI {
  static Future<void> setUserData(UserCredential userInfo) async {
    final user = userInfo.user;
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
