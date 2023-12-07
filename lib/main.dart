// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_nullable_for_final_variable_declarations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';
import 'package:flutter_attendance_system/shared/shared_pref/shared_theme_colors.dart';

import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MaterialColor primarySwatchColor =
  (await ManageLastThemeColor.loadLastThemeColor());
  runApp(
    MainApp(
      primarySwatchAppColor: primarySwatchColor,
    ),
  );
}

class MainApp extends StatefulWidget {
  MaterialColor primarySwatchAppColor;

  MainApp({Key? key, required this.primarySwatchAppColor}) : super(key: key);

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: widget.primarySwatchAppColor,
        textTheme: appTextTheme,
        appBarTheme: appBarTheme,
      ),
      onGenerateRoute: AppRouter(
          onColorChange: changeThemeColor,
          primarySwatchAppColor: widget.primarySwatchAppColor)
          .onGenerateRoute,
    );
  }

  void changeThemeColor(MaterialColor newColor) {
    setState(() {
      widget.primarySwatchAppColor = newColor;
    });
  }
}
