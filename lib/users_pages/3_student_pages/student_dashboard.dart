// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../utilities/custom_widgets/card_widget.dart';


void temp(){}


class StudentDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  StudentDashboard({super.key, this.userName, this.appBarFlexibleSpace});
  @override
  StudentDashboardState createState() => StudentDashboardState();
}

class StudentDashboardState extends State<StudentDashboard> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
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
          cardThumbnail: Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 1",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 2",
        ),
        CustomCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 3",
        ),
        CustomCard(
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
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],


        title: Text('Welcome, ${widget.userName ?? "Student!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.question_mark),
      ),
      body: SingleChildScrollView(
        child: _widgetOptions.elementAt(_selectedIndex),
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

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
