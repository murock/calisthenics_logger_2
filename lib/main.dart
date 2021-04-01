import 'package:calisthenics_logger_2/core/util/theme.dart';
import 'package:calisthenics_logger_2/presentation/pages/calendar_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/charts_page.dart';
import 'package:calisthenics_logger_2/presentation/pages/training_page.dart';
import 'package:flutter/material.dart';

void main() {
  // Paint.enableDithering = true;
  runApp(MyApp());
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
        '/': (context) => CalendarPage(),
        '/tools': (context) => ChartsPage.withSampleData(),
        '/calender': (context) => CalendarPage(),
        '/training': (context) => TrainingPage(),
      },
    );
  }
}
