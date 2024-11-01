import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/login_page.dart';
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

      home: login ? const Home() : const Login(), //home is from dart

    );
  }
}