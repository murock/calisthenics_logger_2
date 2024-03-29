import 'package:calisthenics_logger_2/core/authentication/firebase/sign_in_base.dart';
import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:calisthenics_logger_2/injection.dart';
import 'package:calisthenics_logger_2/presentation/pages/calendar_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/charts_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/login_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/search_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/home_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/training_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  configureDependencies();
  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Handle this when it fails
  await Firebase.initializeApp();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calisthenics Logger 2',
      theme: basicTheme(),
      //  home: ChartsPage.withSampleData(), //TrainingPage(), //
      initialRoute: '/',
      routes: {
        '/': (context) {
          if (SignInBase.isAlreadySignedIn()) {
            return HomePage();
          } else {
            return LoginPage(
              isSignUp: true,
            );
          }
        },
        '/home': (context) => HomePage(),
        '/tools': (context) => ChartsPage.withSampleData(),
        '/calender': (context) => CalendarPage(),
        '/training': (context) => TrainingPage(),
        '/search': (context) => SearchPage(),
      },
    );
  }
}
