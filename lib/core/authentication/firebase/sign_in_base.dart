import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SignInBase {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // TODO remove late so it is forced to be overriden by extended classes

  Future<String?> signIn() async {
    try {
      return await signInWithProvider();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential' &&
          e.credential != null) {
        final GoogleSignIn _googleSignIn = GoogleSignIn();
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
        _linkProviders(userCredential, e.credential!);
      }
    }
  }

  Future<void> signOut();

  Future<String?> signInWithProvider();

  Future<UserCredential?> _linkProviders(
      UserCredential userCredential, AuthCredential newCredential) async {
    return await userCredential.user!.linkWithCredential(newCredential);
  }
}
