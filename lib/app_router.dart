import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/login_page/login.dart';

class AppRouter {
  final Function onColorChange;
  MaterialColor primarySwatchAppColor;

  AppRouter({required this.onColorChange, required this.primarySwatchAppColor});

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => LoginPage(

                onColorChange: onColorChange));
      default:
        return null;
    }
  }
}
