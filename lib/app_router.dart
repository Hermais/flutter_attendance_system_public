import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/login_page/login.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';

import 'features/screens/users_pages/0_developer_admin_pages/developer_admin_dashboard.dart';
import 'features/screens/users_pages/1_faculty_admin_pages/faculty_admin_dashboard.dart';
import 'features/screens/users_pages/1_faculty_admin_pages/faculty_admin_timetable.dart';
import 'features/screens/users_pages/2_instructor_pages/instructor_dashboard.dart';
import 'features/screens/users_pages/commons/instrutor_students_by_applicable_courses.dart';
import 'features/screens/users_pages/3_student_pages/student_dashboard.dart';
import 'features/screens/users_pages/4_parent_pages/parent_dashboard.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case developerAdmin:
        return MaterialPageRoute(
            builder: (context) => const DeveloperAdminDashboard());
      case facultyAdmin:
        return MaterialPageRoute(
            builder: (context) => const FacultyAdminDashboard());
      case instructor:
        return MaterialPageRoute(
            builder: (context) => const InstructorDashboard());
      case student:
        return MaterialPageRoute(
            builder: (context) => const StudentDashboard());
      case parent:
        return MaterialPageRoute(builder: (context) => const ParentDashboard());
      case adminTimetables:
        return MaterialPageRoute(
            builder: (context) => FacultyAdminTimetables(
                  routeName: settings.arguments as String,
                ));
      case instructorStudentsByApplicableCourses:
        return MaterialPageRoute(
            builder: (context) => InstructorCourses(
                  routeName: settings.arguments as String,
                ));
      default:
        return null;
    }
  }
}
