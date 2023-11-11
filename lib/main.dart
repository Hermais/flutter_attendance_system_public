// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

import 'tests/ignore__/login_page.dart';


void main() {
  final ThemeData appTheme = ThemeData(
    // Define the primary color of your app
    primarySwatch: Colors.lightGreen,
    // Define the default button theme
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.lightGreen, // Background color (usually primary color)
      textTheme: ButtonTextTheme.primary, // Use the primary text theme for button text
    ),
    // You can define other theme properties as well...
  );
  MaterialApp mainActivity = MaterialApp(home: LoginPage(),
  theme: appTheme,);
  runApp(mainActivity);
}

