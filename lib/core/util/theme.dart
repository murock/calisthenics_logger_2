import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        color: Colors.white,
      ),
      subtitle1: base.subtitle1!.copyWith(
        fontFamily: 'Nunito',
        fontSize: 30,
        color: Colors.white,
      ),
      subtitle2: base.subtitle1!.copyWith(
        fontFamily: 'Nunito',
        fontSize: 10,
        color: Colors.grey,
      ),
      bodyText1: base.subtitle1!.copyWith(
        fontFamily: 'Nunito',
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  // FloatingActionButtonThemeData _fabTheme(FloatingActionButtonThemeData base) {
  //   return base.copyWith(
  //     //foregroundColor: Color(0Xff71263),
  //     backgroundColor: Color(0Xffd71263),
  //   );
  // }

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

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      accentColor: Color(0Xff71263),
      floatingActionButtonTheme: _fabTheme(base.floatingActionButtonTheme));
}

ThemeData pinkTheme() {
  FloatingActionButtonThemeData _fabPinkTheme(
      FloatingActionButtonThemeData base) {
    return base.copyWith(
      foregroundColor: Colors.white,
      backgroundColor: Color(0Xffd71263),
      shape: CircleBorder(
          // side: BorderSide(
          //   color: Colors.white,
          // ),
          ),
      //foregroundColor: Color(0Xff71263),
      //  backgroundColor: Color(0Xffd71263),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      floatingActionButtonTheme: _fabPinkTheme(base.floatingActionButtonTheme));
}
