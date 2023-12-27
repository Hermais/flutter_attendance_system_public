import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/student_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/student_repository.dart';
import 'package:flutter_attendance_system/core/data/services/student_web_services.dart';
import 'package:flutter_attendance_system/features/widgets/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstructorStudents extends StatelessWidget {
  final String courseCode;
  final String? courseName;

  const InstructorStudents({super.key, required this.courseCode, this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Students of $courseCode'),
        ),

        body: BlocProvider(
          create: (context) => StudentCubit(
              studentRepository:
                  StudentRepository(studentWebServices: StudentWebServices()))
            ..loadStudentByCourseCode(courseCode),
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
                            "Students of $courseName will be shown here.",
                        cardTitle: "${studentState.students[index].firstName} "
                            "${studentState.students[index].lastName}",
                      );
                    });
              }
              return const Center(
                child: Text('No students are assigned yet.'),
              );
            },
          ),
        ));
  }
}
