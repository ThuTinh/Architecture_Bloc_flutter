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
    );
  }

  static ThemeData appThemePure(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.purple1,
      secondaryHeaderColor: AppColors.purple2,
      accentColor: AppColors.purple3,
      cursorColor: AppColors.purple1,
    );
  }

//defaul text
  static TextTheme getDefaultTextTheme(BuildContext context) {
    return TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 20.0));
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
