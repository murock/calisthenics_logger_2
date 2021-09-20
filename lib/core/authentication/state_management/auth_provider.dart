import 'package:calisthenics_logger_2/core/authentication/firebase/sign_in_base.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isError = false;
  bool _signedIn = false;
  bool _isSignUpScreen = true;

  bool get isLoading => _isLoading;
  bool get isError => _isError;
  bool get signedIn => _signedIn;
  bool get isSignUpScreen => _isSignUpScreen;

  void signIn(SignInBase signInAuth, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      await signInAuth.signIn();
    } catch (e) {
      _isError = true;
      _isLoading = false;
      notifyListeners();
      return;
    }
    _isLoading = false;
    _signedIn = true;
    notifyListeners();
    Navigator.pushNamed(context, '/home');
  }

  void toggleSignUpScreen() {
    _isSignUpScreen = !_isSignUpScreen;
    notifyListeners();
  }
}
