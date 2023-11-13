import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/0_developer_admin_pages/developer_admin_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/1_faculuty_admin_pages/fuculty_admin_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/2_instructor_pages/instructor_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/3_student_pages/student_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/4_parent_pages/parent_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/utilities/card_widget.dart';

class NoLoginNavigation extends StatelessWidget {
  final Widget? appBarFlexibleSpace;

  const NoLoginNavigation({super.key, this.appBarFlexibleSpace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarFlexibleSpace,
        title: const Text("Temp Public Navigator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCard(
              cardTitle: "Developer Admin",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DeveloperAdminDashboard(
                          appBarFlexibleSpace: appBarFlexibleSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Faculty Admin",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FacultyAdminDashboard(
                          appBarFlexibleSpace: appBarFlexibleSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Instructor",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InstructorDashboard(
                          appBarFlexibleSpace: appBarFlexibleSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Student",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StudentDashboard(
                          appBarFlexibleSpace: appBarFlexibleSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Parent",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParentDashboard(
                          appBarFlexibleSpace: appBarFlexibleSpace,
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
