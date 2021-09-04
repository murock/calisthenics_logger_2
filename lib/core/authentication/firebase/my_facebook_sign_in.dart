import 'package:calisthenics_logger_2/core/authentication/firebase/sign_in_base.dart';
import 'package:calisthenics_logger_2/core/error/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class MyFacebookSignIn extends SignInBase {
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
          return userCredential.user!.displayName;
        case LoginStatus.cancelled:
          throw AuthException(Status.Cancelled);
        case LoginStatus.failed:
          throw AuthException(Status.Error);
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
