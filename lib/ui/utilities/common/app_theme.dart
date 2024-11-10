import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/utilities/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    datePickerTheme: const DatePickerThemeData(
      headerBackgroundColor: AppColors.thePrimary,
      headerForegroundColor: AppColors.theWhite,
      backgroundColor: AppColors.theWhite,
    ),

    primaryColor: AppColors.thePrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.theWhite,
      centerTitle: false,
      elevation: 0,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 13,
          color: Colors.black54,
        ),
        // to know which one of these you will use search on TextTheme class documentation
        titleMedium: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: AppColors.thePrimary,
        ),
        titleLarge: TextStyle(
          color: AppColors.theWhite,
          fontWeight: FontWeight.bold,
        )),
    //'ColorScheme.fromSeed' this takes from you one color and change all the default color to colors that suites this color
    useMaterial3:
        true, // to make the line under this work 'as this is a new feature'
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.thePrimary),
    scaffoldBackgroundColor: AppColors.theBackgroundLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.theWhite,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 30,
        color: AppColors.thePrimary,
      ),
      unselectedIconTheme: IconThemeData(
        size: 30,
        color: AppColors.theGrey,
      ),
      selectedItemColor: AppColors.thePrimary,
      unselectedItemColor: AppColors.theGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(
        side: BorderSide(color: AppColors.theWhite, width: 4),
      ),
      backgroundColor: AppColors.thePrimary,
      foregroundColor: AppColors
          .theWhite, // this is the color of anything above the background
    ),
  );
}
