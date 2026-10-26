import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFFFFA451);
  static const primaryLight = Color(0xFFFFE3C7);
  static const text = Color(0xFF27214D);
  static const mutedText = Color(0xFF9691BE);
  static const surface = Color(0xFFF9F9F9);
  static const card = Colors.white;
}

abstract final class AppTextStyles {
  static const title = TextStyle(
    color: AppColors.text,
    fontFamily: 'Brandon Grotesque',
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const body = TextStyle(
    color: AppColors.text,
    fontFamily: 'Brandon Grotesque',
    fontSize: 16,
  );

  static const price = TextStyle(
    color: AppColors.text,
    fontFamily: 'Brandon Grotesque',
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.surface,
      fontFamily: 'Brandon Grotesque',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Brandon Grotesque',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.body,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
