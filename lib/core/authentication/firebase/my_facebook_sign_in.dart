import 'package:calisthenics_logger_2/core/authentication/firebase/sign_in_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class MyFacebookSignIn extends SignInBase {
  // TODO: look at handling other errors, perhaps create new exception class for base class to handle?
  @override
  Future<String?> signInWithProvider() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          UserCredential userCredential =
              await auth.signInWithCredential(facebookCredential);
          print(userCredential.user);
          return userCredential
              .user!.displayName; //Resource(status: Status.Success);
        case LoginStatus.cancelled:
          return "cancelled"; //Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          return "failed"; //Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
