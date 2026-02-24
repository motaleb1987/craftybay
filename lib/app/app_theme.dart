import 'package:craftybay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: _progressThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme
  );
  static final ThemeData _darkThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: _progressThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme
  );

  static TextTheme get _textTheme => TextTheme(
        titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
        )
      );


  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 1
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 1
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 1
          )
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Colors.red,
              width: 1
          )
      )
  );

  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
      style: FilledButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          padding: EdgeInsets.symmetric(vertical: 12),
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          )
      )
  );

  static ProgressIndicatorThemeData get _progressThemeData {
    return ProgressIndicatorThemeData(color: AppColors.themeColor);
  }



  static ThemeData get lightTheme => _lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;
}
