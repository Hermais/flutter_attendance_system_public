// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_nullable_for_final_variable_declarations

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/login_page/login.dart';
import 'package:google_fonts/google_fonts.dart';

/// A small change...
///
/// Yet another change...but by hermais0

void main() {
  const MaterialColor? primarySwatchAppColor = Colors.orange;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: primarySwatchAppColor,
      textTheme: GoogleFonts.aBeeZeeTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
      ),
    ),
    home: LoginPage(
        appBarFlexibleSpace: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(18),
            bottomLeft:Radius.circular(18) ),
        gradient: LinearGradient(
          colors: [primarySwatchAppColor,
            primarySwatchAppColor.withOpacity(0.8),
            primarySwatchAppColor.withOpacity(0.4),
            // primarySwatchAppColor.withRed(60),
            // primarySwatchAppColor.withBlue(44),
            // primarySwatchAppColor.withBlue(75)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    )),
  ));
}
