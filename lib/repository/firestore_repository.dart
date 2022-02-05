import 'package:chatapp/api/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/google_signin.dart';

class FirestoreRepository {
  // ログイン時に実行
  Future<void> fetchGoogleSignIn(context) async {
    final userInfo = await GoogleAPI.logIn(context);
    FirestoreAPI.setUserData(userInfo);
  }
}
