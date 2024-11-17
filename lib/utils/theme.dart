import 'package:flutter/material.dart';
import 'styleguide.dart';

class AppTheme {

  // Define datePickerTheme as a static method
  static Widget datePickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: ThemeData.light().copyWith(
        primaryColor: appPrimaryColor, // Header background color
        colorScheme: ColorScheme.light(
          primary: appPrimaryColor, // Selected date and active controls
          onPrimary: Colors.white, // Text color on the header
          onSurface: fontColor, // Default text color
        ),
        dialogBackgroundColor: appBackgroundColor, // Background color of the dialog
      ),
      child: child!,
    );
  }

  // TimePicker Theme
  static Widget timePickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          primary: appPrimaryColor, // Header and active controls
          onPrimary: Colors.white, // Text color on header
          onSurface: fontColor, // Text color on picker items
        ),
        dialogBackgroundColor: appBackgroundColor, // Background color of the dialog
      ),
      child: child!,
    );
  }

  // light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: appPrimaryColor,
    hintColor: appUnselectedIconColor,
    scaffoldBackgroundColor: appBackgroundColor,
    // Background color for main content

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
            }
            return const TextStyle( // Unselected State
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
            return const IconThemeData(
                color: appSelectedIconColor); // Selected State
          }
          return const IconThemeData(
              color: appUnselectedIconColor); // Unselected State
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


    // Overlay Alert
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(appPrimaryColor),
        // Sets the text color
        textStyle: WidgetStateProperty.all(
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),


    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade100,
        // Background color
        hintStyle: TextStyle(color: appUnselectedIconColor),
        // Hint text color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: BorderSide(color: appUnselectedIconColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: BorderSide(
              color: appPrimaryColor), // Border color when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        labelStyle: TextStyle(
          color: appUnselectedIconColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        )
    ),

  );
}