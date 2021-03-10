import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  Color gradientStart = Colors.indigo[900]; //Change start gradient color here
  Color gradientEnd = Colors.blueGrey[900]; //Change end gradient color here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training Page"),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [START_GRADIENT_COLOUR, END_GRADIENT_COLOUR],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
