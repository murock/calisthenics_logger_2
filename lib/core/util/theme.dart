import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
        fontFamily: 'Roboto',
        fontSize: 22.0,
        color: Colors.black,
    ),
  }
}