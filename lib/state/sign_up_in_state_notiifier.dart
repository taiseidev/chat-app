import 'package:chatapp/repository/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInGoogle = StateNotifierProvider(
  (ref) => SignInGoogle(ref.watch(googleSignInRepositoryProvider)),
);

class SignInGoogle extends StateNotifier<GoogleRepositorySignIn> {
  SignInGoogle(GoogleRepositorySignIn state) : super(state);

  Future<void> googleSignIn(BuildContext context) async {
    state.fetchGoogleSignIn(context);
  }
}
