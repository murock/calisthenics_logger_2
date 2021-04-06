import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:calisthenics_logger_2/presentation/pages/calendar_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/charts_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/filter_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/home_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
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
        '/': (context) => FilterPage(), //HomePage(),
        '/tools': (context) => ChartsPage.withSampleData(),
        '/calender': (context) => CalendarPage(),
        '/training': (context) => TrainingPage(),
      },
    );
  }
}
