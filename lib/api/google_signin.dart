import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAPI {
  static Future logIn(BuildContext context) async {
    final _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    GoogleSignInAccount? _signinAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication? auth = await _signinAccount?.authentication;
    if (auth != null) {
      final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      // Google認証を通過した後、Firebase側にログイン　※emailが存在しなければ登録
      final userInfo =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userInfo;
    } else {
      return;
    }
  }
}
