// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_nullable_for_final_variable_declarations

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/login_page/login.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  const MaterialColor? primarySwatchAppColor = Colors.brown;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: primarySwatchAppColor,
      textTheme: GoogleFonts.latoTextTheme(
      ),
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
    home:LoginPage(
        appBarFlexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: primarySwatchAppColor,
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  spreadRadius: -5,
                ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    primarySwatchAppColor[200]!,
                    primarySwatchAppColor[300]!,
                    primarySwatchAppColor[500]!,
                    primarySwatchAppColor[500]!,

                  ],
                  stops: const [
                    0.1,
                    0.3,
                    0.9,
                    1.0
                  ])),
        )),
  ));
}
