import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final defaultThemeData = ThemeData.fallback();

final ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  primaryColor: Colors.blue.shade700,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: defaultThemeData.scaffoldBackgroundColor,
    titleTextStyle: GoogleFonts.montserratTextTheme().titleLarge,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.blue.shade700, //change your color here
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: Colors.blue.shade700,
    unselectedItemColor: Colors.black26, // Set the desired color
  ),
  iconTheme: IconThemeData(
    color: Colors.blue.shade700, //change your color here
  ),
);

final ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.montserratTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    primaryColor: Colors.blue.shade200,
    colorScheme: defaultThemeData.colorScheme.copyWith(
      background: Colors.black87,
      primary: Colors.blue.shade200,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: Colors.white,
      prefixIconColor: Colors.white,
      suffixIconColor: Colors.white,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white38),
      ),
    ),
    scaffoldBackgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black87,
      titleTextStyle: GoogleFonts.montserratTextTheme().titleLarge!.apply(
            color: Colors.white,
          ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.blue.shade200, //change your color here
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.black87,
      selectedItemColor: Colors.blue.shade200,
      unselectedItemColor: Colors.white, // Set the desired color
    ),
    iconTheme: IconThemeData(
      color: Colors.blue.shade200, //change your color here
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(
          Colors.white,
        ),
      ),
    ));
