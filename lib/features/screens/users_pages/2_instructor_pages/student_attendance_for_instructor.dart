import 'package:flutter/material.dart';

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
        body: ListView.builder(
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
            }));
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
