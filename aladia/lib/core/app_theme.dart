import 'package:flutter/material.dart';

class AppTheme {
  // Define the light theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    cardColor: Colors.teal[50],
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(color: Colors.transparent),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.black45),
        // Button background color is white
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.black), // Large text color is dark
      displayMedium:
          TextStyle(color: Colors.black87), // Small text color is light black
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey,
      // Input color is gray
      hintStyle: TextStyle(color: Colors.black),

      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Border color is black
      ),
    ),
  );

  // Define the dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(color: Colors.transparent),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        side: BorderSide(color: Colors.white60, width: 0.7),

        // Button background color is black
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.white), // Large text color is white
      displayMedium: TextStyle(color: Colors.white54),

      // Small text color is light white
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(color: Colors.black),
      fillColor: Colors.white, // Input color is white
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // Border color is white
      ),
    ),
  );
}
