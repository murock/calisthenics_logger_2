import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontFamily: FONT_FAMILY,
        fontWeight: FontWeight.w600,
        fontSize: FONT_SIZE_HEADLINE1.toDouble(),
        color: FONT_COLOUR,
      ),
      headline2: base.subtitle1!.copyWith(
        fontFamily: FONT_FAMILY,
        fontSize: 12,
        color: Colors.white,
      ),
      subtitle1: base.subtitle1!.copyWith(
        fontFamily: FONT_FAMILY,
        fontSize: 30,
        color: FONT_COLOUR,
      ),
      subtitle2: base.subtitle2!.copyWith(
        fontFamily: FONT_FAMILY,
        fontSize: 10,
        color: Colors.grey,
      ),
      bodyText1: base.subtitle1!.copyWith(
        fontFamily: FONT_FAMILY,
        fontSize: FONT_SIZE_BODY_TEXT1.toDouble(),
        color: Colors.grey,
      ),
      bodyText2: base.subtitle1!.copyWith(
        fontFamily: FONT_FAMILY,
        fontSize: FONT_SIZE_BODY_TEXT1.toDouble(),
        color: Colors.white,
      ),
    );
  }

  // Blue highlighted boarder, with blue icon in the middle
  FloatingActionButtonThemeData _fabTheme(FloatingActionButtonThemeData base) {
    return base.copyWith(
      foregroundColor: Color(0Xff3A83AC),
      backgroundColor: Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
          color: Color(0Xff3A83AC),
        ),
      ),
    );
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      accentColor: CONTRAST_COLOUR,
      iconTheme: base.iconTheme.copyWith(
        color: Colors.white,
      ),
      floatingActionButtonTheme: _fabTheme(base.floatingActionButtonTheme));
}

ThemeData pinkTheme() {
  FloatingActionButtonThemeData _fabPinkTheme(
      FloatingActionButtonThemeData base) {
    return base.copyWith(
      foregroundColor: Colors.white,
      backgroundColor: CONTRAST_COLOUR,
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      floatingActionButtonTheme: _fabPinkTheme(base.floatingActionButtonTheme));
}
