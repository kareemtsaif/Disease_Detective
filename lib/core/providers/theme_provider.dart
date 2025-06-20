import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _showNotifications = true;

  bool get isDarkMode => _isDarkMode;
  bool get showNotifications => _showNotifications;

  ThemeData get theme => _isDarkMode ? _darkTheme : _lightTheme;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void toggleNotifications() {
    _showNotifications = !_showNotifications;
    notifyListeners();
  }

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: 'Source Sans Pro',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    fontFamily: 'Source Sans Pro',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      foregroundColor: AppColor.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
