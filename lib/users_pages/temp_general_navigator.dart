import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/0_developer_admin_pages/developer_admin_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/1_faculuty_admin_pages/fuculty_admin_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/2_instructor_pages/instructor_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/3_student_pages/student_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/4_parent_pages/parent_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/utilities/card_widget.dart';

class NoLoginNavigation extends StatelessWidget {
  final Widget? appBarFlexableSpace;

  const NoLoginNavigation({super.key, this.appBarFlexableSpace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarFlexableSpace,
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
                          appBarFlexableSpace: appBarFlexableSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Faculty Admin",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FacultyAdminDashboard(
                          appBarFlexableSpace: appBarFlexableSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Instructor",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InstructorDashboard(
                          appBarFlexableSpace: appBarFlexableSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Student",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StudentDashboard(
                          appBarFlexableSpace: appBarFlexableSpace,
                        )));
              },
            ),
            CustomCard(
              cardTitle: "Parent",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParentDashboard(
                          appBarFlexableSpace: appBarFlexableSpace,
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
