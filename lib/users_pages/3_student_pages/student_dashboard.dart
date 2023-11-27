// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/commons/student_and_parent_info_popup.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utilities/custom_widgets/card_widget.dart';

void temp() {}

class StudentDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  StudentDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  StudentDashboardState createState() => StudentDashboardState();
}

class StudentDashboardState extends State<StudentDashboard> {
  int _selectedIndex = 0;

  List<Widget> provideWidgetOptions(BuildContext context) {
    return <Widget>[
      /// Lectures Tab:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(buttonText: "Attend", onTap: () => showQRCodePopup()),
          InfoCard(buttonText: "Attend", onTap: () => showQRCodePopup()),
          InfoCard(buttonText: "Attend", onTap: () => showQRCodePopup()),
          InfoCard(buttonText: "Attend", onTap: () => showQRCodePopup()),
          InfoCard(buttonText: "Attend", onTap: () => showQRCodePopup()),
          InfoCard(buttonText: "Attend", onTap: () => showQRCodePopup()),
          InfoCard(buttonText: "Attend", onTap: () => showQRCodePopup()),
        ],
      ),

      /// Instructors Tab:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 1",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 2",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 3",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 4",
          ),
        ],
      ),

      /// Timetable Tab:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Sunday",
              cardDescription: "No lectures today.",
              cardThumbnail: Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Monday",
              cardDescription: "No lectures today.",
              cardThumbnail: Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Tuesday",
              cardDescription: "No lectures today.",
              cardThumbnail: Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Wednesday",
              cardDescription: "No lectures today.",
              cardThumbnail: Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Thursday",
              cardDescription: "No lectures today.",
              cardThumbnail: Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Saturday",
              cardDescription: "No lectures today.",
              cardThumbnail: Icon(Icons.table_chart)),
        ],
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: widget.appBarFlexibleSpace,
        title: Text(
          'Welcome, ${widget.userName ?? "Student!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {StudentAndParentInfo(isForStudent: true).studentInfoPopup(context: context);},
        child: Icon(Icons.question_mark),
      ),
      body: SingleChildScrollView(
        child: provideWidgetOptions(context).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 17,
        iconSize: 30,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Lectures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Instructors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'My Timetable',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<void> showQRCodePopup({double? edgeLength, String? qrData}) async {
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
          title:
              const Text('Scan Your QR Code from your instructor\'s device.'),
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


}
