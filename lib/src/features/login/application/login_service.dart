import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> googleSignIn() => _googleSignIn.signIn();
}
