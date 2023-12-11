import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/widgets/card_widget.dart';

class InstructorCourses extends StatelessWidget {
  // routeName variable decides which page to show of students of a specific course.
  final String routeName;

  const InstructorCourses({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Students of $routeName'),
      ),
      body: ListView.builder(
        itemCount: 74,
          itemBuilder: (context, index) {
        return InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardThumbnail: const Icon(Icons.person),
          cardDescription:
              "Students of $routeName will be shown here.",
          cardTitle: "Student ${index + 1}",
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => returnStudentsAttendanceWeeks(
                  studentName: "Student ${index + 1}"
                ))
            );
          },
        );
      }),
    );
  }

  Widget returnStudentsAttendanceWeeks({required String studentName, bool sendListViewOnly=false }) {
    if(sendListViewOnly) {
      return ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            return InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.person),
              cardDescription:
              "Students of $routeName will be shown here.",
              cardTitle: "Week ${index + 1}",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => showStudentsAttendance(
                        studentName: studentName, week: "Week ${index + 1}"
                    ))
                );
              },
            );
          });
    }
    else{
      return Scaffold(
        appBar: AppBar(
          title: Text('Weeks of $studentName'),
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
                "Students of $routeName will be shown here.",
                cardTitle: "Week ${index + 1}",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => showStudentsAttendance(
                          studentName: studentName, week: "Week ${index + 1}"
                      ))
                  );
                },
              );
            }),
      );
    }

  }

  Widget showStudentsAttendance({required String studentName, required String week}) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance of $studentName'),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,
              cardThumbnail: const Icon(Icons.person),
              cardDescription:
              "$studentName's attendance of week $week will be shown here.",
              cardTitle: "CSE30${index + 1}",

            );
          }),
    );
  }
}
