import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/commons/instructor_students_by_applicable_courses.dart';


List<Widget> provideWidgetOptions(BuildContext context) => <Widget>[
      const InstructorCourses(routeName: "Computer and Systems Engineering")
          .returnStudentsAttendanceWeeks(
              studentName: "studentName", withScaffold: true),
      const Center(
          child: Text('Gives information of the whereabouts of the student.')),
    ];
