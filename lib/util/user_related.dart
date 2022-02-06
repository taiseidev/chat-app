import 'package:firebase_auth/firebase_auth.dart';

import '../api/firestore.dart';

class UserRelated {
  // ログインしているユーザーのIDを取得
  static Future<String> getUserId() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final uid = _auth.currentUser!.uid;
    return uid;
  }
}
