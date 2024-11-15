import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserPrefs {
  static const String _userNameKey = 'user_name';
  static const String _userColorKey = 'user_color';

  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  static Future<void> saveUserColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userColorKey, color.value);
  }

  static Future<Color?> getUserColor() async {
    final prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt(_userColorKey);
    if (colorValue != null) {
      return Color(colorValue);
    }
    return null;
  }
}