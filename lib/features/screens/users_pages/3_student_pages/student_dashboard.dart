
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../widgets/card_widget.dart';
import '../commons/student_info_popup.dart';

void temp() {}

class StudentDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  const StudentDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  StudentDashboardState createState() => StudentDashboardState();
}

class StudentDashboardState extends State<StudentDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> provideWidgetOptions(BuildContext context) {
    return <Widget>[
      /// Lectures Tab:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
            InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup()),
        
          ],
        ),
      ),

      /// Instructors Tab:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,

              cardThumbnail: const Icon(Icons.person),
              cardDescription: "The whereabouts of the instructor will be here.",
              cardTitle: "Instructor 1",
            ),
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,

              cardThumbnail: const Icon(Icons.person),
              cardDescription: "The whereabouts of the instructor will be here.",
              cardTitle: "Instructor 2",
            ),
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,

              cardThumbnail: const Icon(Icons.person),
              cardDescription: "The whereabouts of the instructor will be here.",
              cardTitle: "Instructor 3",
            ),
            InfoCard(
              isLectureCard: false,
              isButtonVisible: false,
              isTopLeftBorderMaxRadius: false,

              cardThumbnail: const Icon(Icons.person),
              cardDescription: "The whereabouts of the instructor will be here.",
              cardTitle: "Instructor 4",
            ),
          ],
        ),
      ),

      /// Timetable Tab:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InfoCard(
                isButtonVisible: false,
                isLectureCard: false,
                cardTitle: "Sunday",
                cardDescription: "No lectures today.",
                cardThumbnail: const Icon(Icons.table_chart)),
            InfoCard(
                isButtonVisible: false,
                isLectureCard: false,
                cardTitle: "Monday",
                cardDescription: "No lectures today.",
                cardThumbnail: const Icon(Icons.table_chart)),
            InfoCard(
                isButtonVisible: false,
                isLectureCard: false,
                cardTitle: "Tuesday",
                cardDescription: "No lectures today.",
                cardThumbnail: const Icon(Icons.table_chart)),
            InfoCard(
                isButtonVisible: false,
                isLectureCard: false,
                cardTitle: "Wednesday",
                cardDescription: "No lectures today.",
                cardThumbnail: const Icon(Icons.table_chart)),
            InfoCard(
                isButtonVisible: false,
                isLectureCard: false,
                cardTitle: "Thursday",
                cardDescription: "No lectures today.",
                cardThumbnail: const Icon(Icons.table_chart)),
            InfoCard(
                isButtonVisible: false,
                isLectureCard: false,
                cardTitle: "Saturday",
                cardDescription: "No lectures today.",
                cardThumbnail: const Icon(Icons.table_chart)),
          ],
        ),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text(
          'Welcome, ${widget.userName ?? "Student!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,

        onPressed: () {const StudentAndParentInfo(isForStudent: true).studentInfoPopup(context: context);},
        child: const Icon(Icons.question_mark),
      ),
      body: PageView(
        controller: _pageController,
        children: provideWidgetOptions(context),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 17,
        iconSize: 30,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const <BottomNavigationBarItem>[
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
