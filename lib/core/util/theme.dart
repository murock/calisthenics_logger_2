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
      headline2: base.headline2!.copyWith(
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
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: FONT_FAMILY,
        fontSize: FONT_SIZE_BODY_TEXT1.toDouble(),
        color: Colors.grey,
      ),
      bodyText2: base.bodyText2!.copyWith(
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

  ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: Colors.black38,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
    ));
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    accentColor: CONTRAST_COLOUR,
    iconTheme: base.iconTheme.copyWith(
      color: Colors.white,
    ),
    floatingActionButtonTheme: _fabTheme(base.floatingActionButtonTheme),
    elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),
    // hintColor: CONTRAST_COLOUR,
  );
}

ThemeData pinkTheme() {
  FloatingActionButtonThemeData _fabPinkTheme(
      FloatingActionButtonThemeData base) {
    return base.copyWith(
      foregroundColor: Colors.white,
      backgroundColor: CONTRAST_COLOUR,
      shape: CircleBorder(
        side: BorderSide(
          color: CONTRAST_COLOUR,
        ),
      ),
    );
  }

  final ThemeData base = basicTheme();
  return base.copyWith(
    floatingActionButtonTheme: _fabPinkTheme(base.floatingActionButtonTheme),
    iconTheme: base.iconTheme.copyWith(
      color: CONTRAST_COLOUR,
    ),
  );
}

ThemeData blueTheme() {
  final ThemeData base = basicTheme();
  return base.copyWith(
      iconTheme: base.iconTheme.copyWith(
    color: Color(0Xff3A83AC),
  ));
}
