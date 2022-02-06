import 'package:chatapp/api/firestore.dart';
import 'package:chatapp/model/user/user_model.dart';
import '../api/google_signin.dart';

class FirestoreRepository {
  FirestoreAPI _firestoreAPI = FirestoreAPI();
  // ログイン時に実行
  Future<void> fetchGoogleSignIn(context) async {
    final userInfo = await GoogleAPI.logIn(context);
    _firestoreAPI.setUserData(userInfo);
  }

  Future fetchGetUserInformation() async {
    return _firestoreAPI.getUserData();
  }
}
