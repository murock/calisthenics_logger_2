import 'package:calisthenics_logger_2/core/authentication/firebase/sign_in_base.dart';
import 'package:calisthenics_logger_2/types/loading_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//https://codewithandrea.com/articles/flutter-state-management-riverpod/
Widget build(BuildContext context, WidgetRef ref) {
  // watch the FutureProvider and get an AsyncValue<Weather>
  final weatherAsync = ref.watch(weatherFutureProvider);
  // use pattern matching to map the state to the UI
  return weatherAsync.when(
    loading: () => const CircularProgressIndicator(),
    error: (err, stack) => Text('Error: $err'),
    data: (weather) => Text(weather.toString()),
  );
}

final weatherFutureProvider = FutureProvider.autoDispose<Weather>((ref) {
  // get repository from the provider below
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  // call method that returns a Future<Weather>
  return weatherRepository.getWeather(city: 'London');
});

// example weather repository provider
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository(); // declared elsewhere
});

final authFutureProvider =
    FutureProvider.family<UserCredential, SignInBase>((ref, signInAuth) async {
  final authRepository = ref.watch(authRepositoryProvider);

  return AuthModel().signIn(signInAuth);
});

final authRepositoryProvider = Provider<AuthModel>((ref) {
  return AuthModel(); // declared elsewhere
});

class AuthModel {
  void signIn(SignInBase signInAuth, BuildContext context) async {
    loadingState = LoadingState.loading;
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

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isError = false;
  bool _signedIn = false;
  bool _isSignUpScreen = true;

  bool get isLoading => _isLoading;
  bool get isError => _isError;
  bool get signedIn => _signedIn;
  bool get isSignUpScreen => _isSignUpScreen;

  void signIn(SignInBase signInAuth) async {
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
    //  Navigator.pushNamed(context, '/home');
  }

  void toggleSignUpScreen() {
    _isSignUpScreen = !_isSignUpScreen;
    notifyListeners();
  }
}
