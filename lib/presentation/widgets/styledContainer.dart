import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  final Widget child;

  const StyledContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [START_GRADIENT_COLOUR, END_GRADIENT_COLOUR],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: this.child,
    );
  }
}
