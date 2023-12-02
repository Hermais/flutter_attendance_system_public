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
  final PageController _pageController = PageController(initialPage: 0);

  String? _courseCode;
  String? _startTime;
  String? _endTime;
  String? _hallLocation;
  String ? _courseName;
  String ? _selectTheTerm;
  String ? _groupName;
  String ? _instractorName;
  String ? _courseDescription;
  List<Widget> provideWidgetOptions()=> <Widget>[
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.table_chart),
            cardDescription:
                "Here a small description of the timetable is supplied.",
            cardTitle: "Timetable 1",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.table_chart),
            cardDescription:
                "Here a small description of the timetable is supplied.",
            cardTitle: "Timetable 2",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.table_chart),
            cardDescription:
                "Here a small description of the timetable is supplied.",
            cardTitle: "Timetable 3",
          ),
          InfoCard(
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
    ),
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 1",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 2",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 3",
          ),
          InfoCard(
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
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

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
        onPressed: _showSettingsDialog,
          child: Icon(Icons.settings_suggest),
      ),
      body: PageView(
        controller: _pageController,
        children: provideWidgetOptions(),
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
  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settings'),
          content:SingleChildScrollView(
             child: Column(
            mainAxisSize: MainAxisSize.min,

               children: [
                 DropdownButton<String>(
                   value: _groupName,
                   onChanged: (String? newValue) {
                     setState(() {
                       _groupName = newValue;
                     });
                   },
                   items: <String>['Group 1', 'Group 2', 'Group 3', 'Group 4']
                       .map<DropdownMenuItem<String>>(
                         (String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(value),
                       );
                     },
                   ).toList(),
                   hint: Text('Select Group'),
                 ),
                 SizedBox(height: 16),
                 DropdownButton<String>(
                   value: _selectTheTerm,
                   onChanged: (String? newValue) {
                     setState(() {
                       _selectTheTerm = newValue;
                     });
                   },
                   items: <String>['Term 1', 'Term 2', 'Term 3', 'Term 4']
                       .map<DropdownMenuItem<String>>(
                         (String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(value),
                       );
                     },
                   ).toList(),
                   hint: Text('Select Term'),
                 ),
                 SizedBox(height: 16),
                 Divider(color: Colors.black,thickness: 5,), // Add a divider line

                 Divider(color: Colors.black,thickness: 5,), // Add a divider line
                 Text('to add lecture'),
                 TextField(
                   onChanged: (value) {
                     _instractorName = value;
                   },
                   decoration: InputDecoration(labelText: 'instructor Name'),
                 ),
                 TextField(
                   onChanged: (value) {
                     _courseCode = value;
                   },
                   decoration: InputDecoration(labelText: 'Course Code'),
                 ),
                 TextField(
                   onChanged: (value) {
                     _courseName = value;
                   },
                   decoration: InputDecoration(labelText: 'Course Name'),
                 ),
                 TextField(
                   onChanged: (value) {
                     _startTime = value;
                   },
                   decoration: InputDecoration(labelText: 'Start Time'),
                 ),
                 TextField(
                   onChanged: (value) {
                     _endTime = value;
                   },
                   decoration: InputDecoration(labelText: 'End Time'),
                 ),
                 TextField(
                   onChanged: (value) {
                     _hallLocation = value;
                   },
                   decoration: InputDecoration(labelText: 'Hall Location'),
                 ),
                 TextField(
                   onChanged: (value) {
                     _courseDescription = value;
                   },
                   decoration: InputDecoration(labelText: 'course description'),
                 ),
               ],
             ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {

                // Do something with the entered data

                Navigator.pop(context); // Close the dialog
              },
              child: Text('add lecture'),
            ),
          ],
        );
      },
    );
  }


}
