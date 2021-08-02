import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInBase {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> signIn() async {
    try {
      return await signInWithProvider();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential' &&
          e.credential != null) {
        _signInToGoogle(link: true);
      }
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await auth.signOut();
  }

  Future<String?> signInWithProvider() async {
    this._signInToGoogle();
  }

  Future<String?> _signInToGoogle({bool link = false}) async {
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
      if (link) {
        await _linkProviders(userCredential, credential);
      }
      return userCredential.user!.displayName;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<UserCredential?> _linkProviders(
      UserCredential userCredential, AuthCredential newCredential) async {
    return await userCredential.user!.linkWithCredential(newCredential);
  }
}
