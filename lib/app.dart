import 'package:drive2ibiza/utils/theme.dart';
import 'package:flutter/material.dart';
import 'pages/navigation.dart';
import 'pages/login/login.dart';

// Placeholder for login
// TODO: Login entwickeln
bool login = false;

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,

      // 0 is calendar page
      home: login ? const Navigation(currentIndex: 0,) : const Login(),

    );
  }
}