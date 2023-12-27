import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/auth_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/student_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/student_repository.dart';
import 'package:flutter_attendance_system/core/data/services/student_web_services.dart';
import 'package:flutter_attendance_system/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/card_widget.dart';

class InstructorStudentsAttendanceByWeek extends StatelessWidget {
  // routeName variable decides which page to show of students of a specific course.
  final String week;
  final String courseCode;
  final int instructorId;

  const InstructorStudentsAttendanceByWeek(
      {super.key, required this.week, required this.courseCode, required this.instructorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Students of Week $week'),
        ),

        body: BlocProvider(
          create: (context) => StudentCubit(
              studentRepository:
                  StudentRepository(studentWebServices: StudentWebServices()))
            ..loadStudentAttendanceByCodeWeekInstructorId(courseCode, week, instructorId),
          child: BlocBuilder<StudentCubit, StudentState>(
            builder: (context, studentState) {
              if (studentState is StudentInitial) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              if (studentState is StudentLoaded &&
                  (studentState.students.isNotEmpty)) {
                return ListView.builder(
                    itemCount: studentState.students.length,
                    itemBuilder: (context, index) {
                      return InfoCard(
                        isLectureCard: false,
                        isButtonVisible: false,
                        isTopLeftBorderMaxRadius: false,
                        cardThumbnail: const Icon(Icons.person),
                        cardDescription:
                            "This student attended $courseCode lecture.",
                        cardTitle: "${studentState.students[index].firstName} "
                            "${studentState.students[index].lastName}",
                      );
                    });
              }
              return const Center(
                child: Text('No students attended this week.'),
              );
            },
          ),
        ));
  }
}

class ShowWeeks extends StatelessWidget {
  final String courseCode;
  const ShowWeeks({super.key, required this.courseCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Week'),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.person),
              cardDescription:
                  "Show the attendance of the students for week ${index + 1}.",
              cardTitle: "Week ${index + 1}",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return InstructorStudentsAttendanceByWeek(
                    week: '${index + 1}',
                    courseCode: courseCode,
                    instructorId: (authCubit.state as AuthSuccess).authGet.id,
                  );
                }));
              });
        },
      ),
    );
  }
}
