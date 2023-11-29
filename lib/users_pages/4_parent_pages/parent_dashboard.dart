// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/utilities/custom_widgets/card_widget.dart';

import '../commons/student_info_popup.dart';



void temp(){}


class ParentDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  ParentDashboard({super.key, this.userName, this.appBarFlexibleSpace});
  @override
  _ParentDashboardState createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  int _selectedIndex = 0;

   List<Widget> provideWidgetOptions() => <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoCard(cardTitle: "Week 1", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 2",isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 3", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 4", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 5", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 6", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 7", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 8", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 9", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 10", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 11", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),
        InfoCard(cardTitle: "Week 12", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: Icon(Icons.check),),

      ],
    ),
    Text('Gives information of the whereabouts of the student.'),
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



        title: Text('Welcome, ${widget.userName ?? "Parent!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {StudentAndParentInfo().studentInfoPopup(context: context);},
        child: Icon(Icons.question_mark),
      ),
      body: SingleChildScrollView(
        child: provideWidgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 17,
        iconSize: 30,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(


            icon: Icon(Icons.checklist),
            label: 'Attendance Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_rounded),
            label: 'Student Whereabouts',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
