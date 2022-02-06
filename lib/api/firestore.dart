import 'package:chatapp/model/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../util/user_related.dart';

class FirestoreAPI {
// Firestoreをインスタンス化
  static final _db = FirebaseFirestore.instance;

  // ユーザーコレクションテキスト
  static const user = 'user';

  // ユーザー情報をFirestoreに保存
  Future<void> setUserData(UserCredential userInfo) async {
    final _user = userInfo.user!;
    // ユーザーIDを指定してFirestoreに保存
    await _db.collection('user').doc(_user.uid).set(
      {
        'uid': _user.uid,
        'name': _user.displayName,
        'email': _user.email,
        'iconURL': _user.photoURL,
        'message': ""
      },
    );
  }

// ユーザ情報をFirestoreから取得
  Future getUserData() async {
    final uid = await UserRelated.getUserId();
    final snapShot = await _db.doc('$user/$uid').get();
    return UserModel.fromSnapshot(snapShot);
  }
}
