import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<GoogleSignInAccount?> login() async {
    print('here we go');
    return await _googleSignIn.signIn();
  }
}
