// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_nullable_for_final_variable_declarations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/login_page/login.dart';
import 'package:flutter_attendance_system/shared_pref/load_last_theme_color.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
MaterialColor primarySwatchColor =( await ManageLastThemeColor.loadLastThemeColor() ) ;
  runApp(MainApp(primarySwatchAppColor:   primarySwatchColor,));
}



class MainApp extends StatefulWidget {
  MaterialColor primarySwatchAppColor;
   MainApp({Key? key, required this.primarySwatchAppColor }) : super(key: key);

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: widget.primarySwatchAppColor,
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
        onColorChange: changeThemeColor,
          appBarFlexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.primarySwatchAppColor,
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    spreadRadius: -5,
                  ),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.primarySwatchAppColor[200]!,
                      widget.primarySwatchAppColor[300]!,
                      widget.primarySwatchAppColor[500]!,
                      widget.primarySwatchAppColor[500]!,

                    ],
                    stops: const [
                      0.1,
                      0.3,
                      0.9,
                      1.0
                    ])),
          )),
    );
  }

  void changeThemeColor(MaterialColor newColor) {
    setState(() {
      widget.primarySwatchAppColor = newColor;
    });
  }
}






