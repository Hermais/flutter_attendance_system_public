// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../utilities/custom_widgets/card_widget.dart';

class FacultyAdminDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  FacultyAdminDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  FacultyAdminDashboardState createState() => FacultyAdminDashboardState();
}

class FacultyAdminDashboardState extends State<FacultyAdminDashboard> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
              "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 1",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
              "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 2",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
              "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 3",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
              "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 4",
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 1",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 2",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 3",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 4",
        ),
      ],
    ),
  ];

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
          'Welcome, ${widget.userName ?? "Faculty Admin!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.settings_suggest),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_widgetOptions.elementAt(_selectedIndex)],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 17,
        iconSize: 30,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Timetables',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Instructors',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
