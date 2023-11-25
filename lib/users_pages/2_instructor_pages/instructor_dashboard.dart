// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/qr_apis/qr_app.dart';
import 'package:flutter_attendance_system/users_pages/utilities/custom_widgets/card_widget.dart';

void temp() {}


class InstructorDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;


  InstructorDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  InstructorDashboardState createState() => InstructorDashboardState();
}

class InstructorDashboardState extends State<InstructorDashboard> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    /// Lectures Tab:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),

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
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 1",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 2",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 3",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 4",
        ),

      ],
    )
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
flexibleSpace: widget.appBarFlexibleSpace,
        title: Text(
          'Welcome, ${widget.userName ?? "Instructor!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QRScannerWithScaffold(appBarFlexibleSpace: widget.appBarFlexibleSpace,
                storeScanResult: temp,
              ),
            ),
          );
        },
        child: Icon(Icons.qr_code_scanner),
      ),
      body: SingleChildScrollView(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[ _widgetOptions.elementAt(_selectedIndex)],
      ),),
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
            icon: Icon(Icons.people),
            label: 'Students',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
