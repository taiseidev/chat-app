import 'package:chatapp/state/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAPI {
  static Future<UserCredential> logIn(BuildContext context) async {
    final _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    GoogleSignInAccount? signinAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication auth = await signinAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );

    final userInfo =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userInfo;
  }
}
