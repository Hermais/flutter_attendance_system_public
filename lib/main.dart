// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/1_faculuty_admin_pages/fuculty_admin_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/2_instructor_pages/instructor_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/3_student_pages/student_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/4_parent_pages/parent_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page/login.dart';



// void main() {
//   final ThemeData appTheme = ThemeData(
//     // Define the primary color of your app
//     primarySwatch: Colors.lightGreen,
//     // Define the default button theme
//     buttonTheme: ButtonThemeData(
//       buttonColor: Colors.lightGreen, // Background color (usually primary color)
//       textTheme: ButtonTextTheme.primary, // Use the primary text theme for button text
//     ),
//     // You can define other theme properties as well...
//   );
//   MaterialApp mainActivity = MaterialApp(home: LoginPage(),
//   theme: appTheme,);
//   runApp(mainActivity);
// }
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.aBeeZeeTextTheme(),


      ),
    home: FacultyAdminDashboard()),
  );
}
