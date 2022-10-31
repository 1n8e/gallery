import 'package:flutter/material.dart';
import 'package:test_project/core/const_colors.dart';
import 'package:test_project/core/const_text_styles.dart';

enum AppTheme {
  LightAppTheme,
  DarkAppTheme,
}

final appTheme = {
  AppTheme.DarkAppTheme: ThemeData(
    backgroundColor: ConstColors.darkBGcolor,
    bottomAppBarColor: ConstColors.darkAppBarColor,
    primaryColor: ConstColors.darkIconColor,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: ConstColors.darkIconColor)),
    textTheme: const TextTheme(
      titleLarge: ConstTextStyles.appBarTitleStyle,
      titleMedium: ConstTextStyles.appBarLabelTextStyle,
      titleSmall: ConstTextStyles.titleTextStyle,
    ),
  ),
  AppTheme.LightAppTheme: ThemeData(
    backgroundColor: ConstColors.lightBGcolor,
    bottomAppBarColor: ConstColors.lightAppBarColor,
    primaryColor: ConstColors.lightIconColor,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: ConstColors.lightIconColor)),
    textTheme: TextTheme(
      titleLarge:
          ConstTextStyles.appBarTitleStyle.copyWith(color: Colors.black),
      titleMedium:
          ConstTextStyles.appBarLabelTextStyle.copyWith(color: Colors.black),
      titleSmall: ConstTextStyles.titleTextStyle.copyWith(color: Colors.black),
    ),
  ),
};
