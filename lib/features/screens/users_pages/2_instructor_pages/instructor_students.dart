import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/widgets/card_widget.dart';

class InstructorStudents extends StatelessWidget {
  final String courseName;

  const InstructorStudents({super.key,required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Students of $courseName'),
        ),
        // TODO: Fetch the actual list of students of the course from the database.
        /// This is done by specifying the current user in the shared preference
        /// file to be implemented and getting the information of the instructor.
        body: ListView.builder(
            itemCount: 74,
            itemBuilder: (context, index) {
              return InfoCard(
                isLectureCard: false,
                isButtonVisible: false,
                isTopLeftBorderMaxRadius: false,
                cardThumbnail: const Icon(Icons.person),
                cardDescription: "Students of $courseName will be shown here.",
                cardTitle: "Student ${index + 1}",


              );
            }));
  }


}
