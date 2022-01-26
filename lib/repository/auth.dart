import 'package:chatapp/api/auth/google_signin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleSignInRepositoryProvider = Provider<GoogleRepositorySignIn>(
  (_) => GoogleRepositorySignIn(),
);

class GoogleRepositorySignIn {
  final GoogleAPI _api = GoogleAPI();

  Future fetchGoogleSignIn(context) async {
    return _api.logIn(context);
  }
}
