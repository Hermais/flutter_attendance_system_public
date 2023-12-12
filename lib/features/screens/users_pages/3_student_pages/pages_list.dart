import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/1_faculty_admin_pages/faculty_admin_timetable.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../shared/constants_and_statics/shared_vars.dart';
import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions(BuildContext context) {
  return <Widget>[
    /// Lectures Tab:
    ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InfoCard(
              buttonText: "Attend",
              onButtonTap: () => showQRCodePopup(context));
        }),

    /// Instructors Tab:
    ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor ${index + 1}",
        );
      },
    ),

    /// Timetable Tab:
    ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return InfoCard(
          isButtonVisible: false,
          isLectureCard: false,
          cardTitle: days[index],
          cardDescription: "No lectures today.",
          cardThumbnail: const Icon(Icons.table_chart),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              /// An arbitrary academic year and department is passed to
              /// the constructor. In actual implementation, the academic year
              /// and department will be provided.
              return FacultyAdminTimetables(
                academicYear: academicYears[0],
              ).getLecturesByDay(days[index], department: departments[0]);
            }));
          },
        );
      },
    ),
  ];
}

Future<void> showQRCodePopup(BuildContext context,
    {double? edgeLength, String? qrData}) async {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  if (deviceWidth > deviceHeight) {
    edgeLength = deviceWidth * 0.3;
  } else {
    edgeLength = deviceHeight * 0.3;
  }
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Scan Your QR Code from your instructor\'s device.'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: edgeLength,
                  width: edgeLength,
                  child: QrImageView(
                      data: qrData ?? "data",
                      size: 300.0,
                      version: QrVersions.auto))
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
