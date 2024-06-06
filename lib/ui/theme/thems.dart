import 'package:flutter/material.dart';

import 'package:product_show_case/ui/theme/colors.dart';
import 'package:product_show_case/ui/theme/text_style.dart';

class Themes {
  static const String roboto = 'Roboto';

  static final ThemeData jhLight = ThemeData(
    scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all(primaryColor)),
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightScaffoldBgColor,
    primaryColor: primaryColor,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: regularTextStyle.copyWith(color: lightAppBarColor),
      centerTitle: true,
      backgroundColor: lightScaffoldBgColor,
    ),
    hintColor: hintColor,
    fontFamily: roboto,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: grey),
      labelMedium: TextStyle(color: darkGrey),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.white),
    ),
    highlightColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: normalTextStyle.copyWith(color: primaryColor),
      selectedItemColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: primaryColor),
        ),
      ),
    ),
  );
  static final ThemeData jhDark = ThemeData(
    brightness: Brightness.dark,
    scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all(primaryColor)),
    scaffoldBackgroundColor: darkScaffoldBgColor,
    primaryColor: primaryColor,
    cardColor: Colors.black,
    appBarTheme: AppBarTheme(
      titleTextStyle: regularTextStyle.copyWith(color: Colors.white),
      centerTitle: true,
      backgroundColor: darkScaffoldBgColor,
    ),
    textTheme: const TextTheme(
      labelSmall: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: primaryColor),
        ),
      ),
    ),
  );

  static ButtonStyle borderButtonStyle() {
    return ElevatedButton.styleFrom(
      textStyle: regularTextStyle.copyWith(fontWeight: FontWeight.w400),
      foregroundColor: darkGrey,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Border radius
        side: const BorderSide(color: grey, width: 0.5), // Border color
      ),
    );
  }

  static ButtonStyle filledButtonStyle(Color color) {
    return ElevatedButton.styleFrom(
      textStyle: regularTextStyle,
      backgroundColor: secondaryColor, // Text color
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        // Border radius
        // Border color
      ),
    );
  }

  static BoxShadow commonShadow() {
    return BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 5,
      spreadRadius: 0.4,
      color: hintColor.withOpacity(0.4),
    );
  }
}
