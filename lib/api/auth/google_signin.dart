import 'package:chatapp/repository/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../first_page.dart';

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
    FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatApp(),
      ),
    );
  }
}
