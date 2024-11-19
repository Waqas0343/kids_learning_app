import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_constant_file/app_colors.dart';

class AppThemeInfo {
  static double get borderRadius => 6.0;

  static ThemeData get themeData {
    var primaryColor = const MaterialColor(0xFF3876F2, {
      50: Color(0xffe6effd),
      100: Color(0xffc2d8fa),
      200: Color(0xff99bff7),
      300: Color(0xff70a5f3),
      400: Color(0xff518ff0),
      500: Color(0xFF3876F2),
      600: Color(0xff3369d8),
      700: Color(0xff2c5ab9),
      800: Color(0xff254b99),
      900: Color(0xff1b3977),
    });

    var baseTheme = ThemeData(
      useMaterial3: false, // Disabling Material 3
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppThemeInfo.borderRadius),
        ),
        filled: false,
        fillColor: MyColors.fillColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 12,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              AppThemeInfo.borderRadius,
            ),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MyColors.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeInfo.borderRadius),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColors.primaryColor,
        elevation: 2,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: MyColors.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          side: const BorderSide(color: MyColors.primaryColor),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.primaryColor,
        selectionHandleColor: MyColors.primaryColor,
        selectionColor: MyColors.primaryColor.withOpacity(0.5),
      ),
      tabBarTheme: const TabBarTheme(
        labelStyle: TextStyle(fontSize: 16),
        unselectedLabelStyle: TextStyle(fontSize: 16),
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppThemeInfo.borderRadius),
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return MyColors.primaryColor;
            }
            return null;
          },
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return MyColors.primaryColor;
            }
            return null;
          },
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return MyColors.primaryColor;
            }
            return null;
          },
        ),
        trackColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return null;
            }
            if (states.contains(WidgetState.selected)) {
              return MyColors.primaryColor;
            }
            return null;
          },
        ),
      ),
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primaryColor,
        accentColor: MyColors.primaryColor,
        backgroundColor: Colors.white,
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.openSansTextTheme(baseTheme.textTheme),
    );
  }
}
