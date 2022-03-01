import 'package:chatapp/api/firestore.dart';
import 'package:chatapp/model/friend/friend_list_model.dart';
import 'package:chatapp/model/friend/friend_model.dart';
import 'package:chatapp/model/user/user_model.dart';
import 'package:chatapp/util/user_related.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../api/google_signin.dart';

class FirestoreRepository {
  FirestoreAPI _firestoreAPI = FirestoreAPI();
  static final uid = UserUtility.getCurrentUserId();
  static final user = 'user';
  static final friendUsers = 'friendUsers';
  static final db = FirebaseFirestore.instance;

  // ログイン時に実行
  Future<void> fetchGoogleSignIn(context) async {
    UserCredential userInfo = await GoogleAPI.logIn(context);
    _firestoreAPI.setUserData(userInfo);
  }

  Future fetchGetUserInformation() async {
    return _firestoreAPI.getUserData();
  }

  static Future<List<UserModel>> fetchUsersInformation() async {
    final snapshot = await FirebaseFirestore.instance.collection('$user').get();
    if (snapshot == null) {
      return [];
    }
    print('ユーザー一覧を取得');
    final userList =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userList;
  }

  // 友達をfriendUsersコレクションに保存する
  static Future<void> registerFriendList(String name, String uid) async {
    final path = db.collection('$user/$uid/$friendUsers');
    await path.add(
      {
        'name': name,
        'userId': uid,
        'createdAt': DateTime.now(),
      },
    );
  }

  static Stream<List<FriendListModel>> fetchFriendList() {
    final snapShot = db.collection('$user/$uid/$friendUsers');
    final stream = snapShot.snapshots().map(
          (e) => e.docs
              .map(
                (e) => FriendListModel.fromJson(e.data()),
              )
              .toList(),
        );
    return stream;
  }
}
