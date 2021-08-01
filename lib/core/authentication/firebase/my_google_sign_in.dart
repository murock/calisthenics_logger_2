import 'package:calisthenics_logger_2/core/authentication/firebase/sign_in_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyGoogleSignIn extends SignInBase {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await auth.signOut();
  }

  @override
  Future<String?> signInWithProvider() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      return userCredential.user!.displayName;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
