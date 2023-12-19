import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/4_parent_pages/student_attendance_for_parent.dart';

import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions(BuildContext context) => <Widget>[
      // const InstructorStudents(routeName: "Computer and Systems Engineering")
      //     .returnStudentsAttendanceWeeks(
      //         studentName: "studentName", withScaffold: true),
      ListView.builder(
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
                  return const  ShowDays()  ;


                }));
              });
        },
      ),
      const Center(
          child: Text('Gives information of the whereabouts of the student.')),
    ];
