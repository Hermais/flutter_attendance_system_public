import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/student_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/student_repository.dart';
import 'package:flutter_attendance_system/core/data/services/student_web_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/card_widget.dart';

class InstructorStudentsAttendanceByWeek extends StatelessWidget {
  // routeName variable decides which page to show of students of a specific course.
  final String week;
  final String lectureName;

  const InstructorStudentsAttendanceByWeek(
      {super.key, required this.week, required this.lectureName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Students of $week'),
        ),
        // TODO: Fetch the actual list of students who attend the course for instructor
        //  from the database.
        body: BlocProvider(
  create: (context) => StudentCubit(studentRepository:StudentRepository(studentWebServices:StudentWebServices()))..loadStudent(),
  child: BlocBuilder<StudentCubit, StudentState>(
  builder: (context, studentState) {
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
                cardDescription: "Students of $week will be shown here.",
                cardTitle: "Student ${index + 1}",
              );
            });}
    return Placeholder();
  },

),
));
  }
}


class ShowWeeks extends StatelessWidget {

  const ShowWeeks({super.key});

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
            cardDescription: "Show the attendance of the students for week ${index+1}.",
            cardTitle: "Week ${index + 1}",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return InstructorStudentsAttendanceByWeek(week: "Week ${index + 1}", lectureName: "Lecture ${index + 1}",);
              }));
            }
          );
        },
      ),
    );
  }
}
