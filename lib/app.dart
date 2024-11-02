import 'package:drive2ibiza/pages/map/map.dart';
import 'package:flutter/material.dart';
import 'pages/navigation.dart';
import 'pages/login/login.dart';
import 'utils/styleguide.dart';

// Placeholder for login
bool login = false;

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: appBackgroundColor, // Background Color main Content

        appBarTheme: const AppBarTheme(
          backgroundColor: appNavBarColor, // Down Nav bar background
          foregroundColor: normalLabel, // Text Color
        ),

        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: appNavBarColor,
          indicatorColor: appNavBarColor, // to prevent a circle around the icon

          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (Set<WidgetState> states) {
              // Change color for selected/unselected items
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: appSelectedIconColor); // selected Color
              }
              return const IconThemeData(color: appUnselectedIconColor); // Unselected Color
            },
          ),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: appSelectedIconColor); // Selected label color
              }
              return const TextStyle(color: appSecondaryColor); // Unselected label color
            },
          ),
        ),
      ),

      // 0 is calendar page
      home: login ? const Navigation(currentIndex: 0,) : const Login(),

    );
  }
}