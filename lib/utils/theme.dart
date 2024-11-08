import 'package:flutter/material.dart';
import 'styleguide.dart';

class AppTheme {
  // light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: appPrimaryColor,
    hintColor: appUnselectedIconColor,
    scaffoldBackgroundColor: appBackgroundColor, // Background color for main content

    // Navbar
    appBarTheme: AppBarTheme(
      backgroundColor: appNavBarColor, // Down Nav bar background
      foregroundColor: fontColor, // Text color
      elevation: 0,
      titleTextStyle: TextStyle(
        color: fontColor,
        fontSize: primaryHeading,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: appNavBarColor,
      indicatorColor: appNavBarColor, // To prevent a circle around the icon
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle( // Selected State
                color: appPrimaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                fontFamily: 'Roboto'
              );
            } return const TextStyle( // Unselected State
              color: appUnselectedIconColor,
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
              fontFamily: 'Roboto'
            );
          }
      ),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: appSelectedIconColor); // Selected State
          }
          return const IconThemeData(color: appUnselectedIconColor); // Unselected State
        },
      ),

    ),

    // Labels
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: appSecondaryColor,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.normal,
      ), // Default text color
    ),


  );
}