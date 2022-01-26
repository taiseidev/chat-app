import 'package:chatapp/api/firestore/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAPI {
  void logIn(BuildContext context) async {
    final _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    GoogleSignInAccount? signinAccount = await _googleSignIn.signIn();
    if (signinAccount == null) return;

    GoogleSignInAuthentication auth = await signinAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );

    FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
      FirestoreAPI.setUserData(value); // FirestoreにUserデータを保存
    });
  }
}
