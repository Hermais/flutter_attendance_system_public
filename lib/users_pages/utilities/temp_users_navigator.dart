import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/0_developer_admin_pages/developer_admin_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/1_faculty_admin_pages/faculty_admin_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/2_instructor_pages/instructor_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/3_student_pages/student_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/4_parent_pages/parent_dashboard.dart';
import 'package:flutter_attendance_system/users_pages/utilities/custom_widgets/card_widget.dart';

class NoLoginNavigation extends StatelessWidget {
  final Widget? appBarFlexibleSpace;

  const NoLoginNavigation({Key? key, this.appBarFlexibleSpace}) : super(key: key);

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
            InfoCard(
              cardThumbnail: const Icon(Icons.developer_mode),
              cardTitle: "Developer Admin",
              isLectureCard: false,

              onTap: () {
                _navigateToPage(context, DeveloperAdminDashboard(appBarFlexibleSpace: appBarFlexibleSpace));
              },
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.admin_panel_settings),
              cardTitle: "Faculty Admin",
              isLectureCard: false,

              onTap: () {
                _navigateToPage(context, FacultyAdminDashboard(appBarFlexibleSpace: appBarFlexibleSpace));
              },
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.person),
              cardTitle: "Instructor",
              isLectureCard: false,
              onTap: () {
                _navigateToPage(context, InstructorDashboard(appBarFlexibleSpace: appBarFlexibleSpace));
              },
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.supervised_user_circle),
              cardTitle: "Student",
              isLectureCard: false,

              onTap: () {
                _navigateToPage(context, StudentDashboard(appBarFlexibleSpace: appBarFlexibleSpace));
              },
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.supervisor_account),
              cardTitle: "Parent",
              isLectureCard: false,

              onTap: () {
                _navigateToPage(context, ParentDashboard(appBarFlexibleSpace: appBarFlexibleSpace));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var curveTween = CurveTween(curve: curve);
        var tween = Tween(begin: begin, end: end).chain(curveTween);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ));
  }
}
