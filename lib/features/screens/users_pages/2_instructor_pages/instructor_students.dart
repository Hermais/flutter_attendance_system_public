import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/student_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/student_repository.dart';
import 'package:flutter_attendance_system/core/data/services/student_web_services.dart';
import 'package:flutter_attendance_system/features/widgets/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/user_cubit.dart';

class InstructorStudents extends StatelessWidget {
  final String courseName;

  const InstructorStudents({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Students of $courseName'),
        ),
        // TODO: Fetch the actual list of students of the course from the database.
        /// This is done by specifying the current user in the shared preference
        /// file to be implemented and getting the information of the instructor.
        body: BlocProvider(
          create: (context) =>
              StudentCubit(
                  studentRepository:
                  StudentRepository(studentWebServices: StudentWebServices()))..loadStudent(),
          child: BlocBuilder<StudentCubit, StudentState>(
            builder: (context, studentState){

              if(studentState is StudentInitial){

                return Center(
                  child: CircularProgressIndicator(color: Theme
                      .of(context)
                      .primaryColor,),
                );
    }
              if (studentState is StudentLoaded){
              return ListView.builder(
                  itemCount: 74,
                  itemBuilder: (context, index) {
                    return InfoCard(
                      isLectureCard: false,
                      isButtonVisible: false,
                      isTopLeftBorderMaxRadius: false,
                      cardThumbnail: const Icon(Icons.person),
                      cardDescription:
                      "Students of $courseName will be shown here.",
                      cardTitle: "Student ${index + 1}",
                    );
                  });}
              return Placeholder();
            },
          ),
        ));
  }
}
