import 'package:demo_bloc/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData appThemeBlue(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.blue1,
        secondaryHeaderColor: AppColors.blue2,
        accentColor: AppColors.blue3,
        cursorColor: AppColors.blue1,
        fontFamily: 'Comfortaa',
        textTheme: getDefaultTextTheme(context));
  }

  static ThemeData appThemePure(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.purple1,
        secondaryHeaderColor: AppColors.purple2,
        accentColor: AppColors.purple3,
        cursorColor: AppColors.purple1,
        fontFamily: 'Comfortaa',
        textTheme: getDefaultTextTheme(context));
  }

//defaul text
  static TextTheme getDefaultTextTheme(BuildContext context) {
    return TextTheme(
      headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600),
      bodyText1: TextStyle(fontSize: 20.0),
      bodyText2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
      button: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
      caption: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
      subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
      subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
    );
  }

//override text
  static TextTheme getItalicTitleTextTheme(BuildContext context) {
    return Theme.of(context).textTheme.copyWith(
          headline1: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        );
  }
}
