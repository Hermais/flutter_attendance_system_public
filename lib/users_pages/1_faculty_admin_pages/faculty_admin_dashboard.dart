// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field


import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/users_pages/1_faculty_admin_pages/pages_list.dart';
import 'package:flutter_attendance_system/users_pages/utilities/custom_widgets/drop_down_button.dart';
import 'package:flutter_attendance_system/users_pages/utilities/custom_widgets/text_button_clock_viewer.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _courseCode;
  String? _startTime;
  String? _endTime;
  String? _hallLocation;
  String? _courseName;
  String? _term;
  String? _groupName;
  String? _instructorName;
  String? _courseDescription;
  String? _department;
  bool? _isFloatingActionButtonVisible;



  void _onItemTapped(int index) {
    setState(() {
      _isFloatingActionButtonVisible = true;
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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
      floatingActionButton: Visibility(
        visible: _isFloatingActionButtonVisible ?? true,
        child: AnimatedOpacity(
          opacity: _selectedIndex == 0 ? 1.0 : 0.0,
          duration: Duration(milliseconds: 200),
          onEnd: (){_isFloatingActionButtonVisible = _selectedIndex==0 ?true:false; setState(() {

          });},// Adjust the duration as needed
          child: FloatingActionButton(
            onPressed: _showSettingsDialog,
            child: Icon(Icons.settings_suggest),
          ),
        ),
      ),

      body: PageView(
        controller: _pageController,
        children: provideWidgetOptions(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
            _isFloatingActionButtonVisible = _selectedIndex==0;
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

  Future<void> _showSettingsDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          key: _formKey,
          title: Text('Add Lecture'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Specify Main Properties:'),
                DropdownButtonWidget<String>(
                  items: ['CSE', 'Mechanics', 'Power'],
                  selectionDescription: 'Select Department',
                  setValue: (String? value) {
                    department = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: [
                    'Group 1',
                    'Group 2',
                    'Group 3',
                    'Group 4',
                    'Group 5'
                  ],
                  selectionDescription: 'Select Group',
                  setValue: (String? value) {
                    groupName = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: ['Term 1', 'Term 2'],
                  selectionDescription: 'Select Term',
                  setValue: (String? value) {
                    term = value!;
                  },
                ),
                SizedBox(height: 16),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Text('Select Lecture Details:'),
                ClockViewerTextButton(
                  setChangedTime: (String? value) {
                    startTime = value!;
                  },
                  selectedTime: 'Select a start time',
                ),
                ClockViewerTextButton(
                  setChangedTime: (String? value) {
                    endTime = value!;
                  },
                  selectedTime: 'Select a start time',
                ),
                DropdownButtonWidget<String>(
                  items: [
                    'Instructor 1',
                    'Instructor 2',
                    'Instructor 3',
                    'Instructor 4'
                  ],
                  selectionDescription: 'Select Instructor',
                  setValue: (String? value) {
                    instructorName = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: ['Code 1', 'Code 2', 'Code 3', 'Code 4'],
                  selectionDescription: 'Select Course Code',
                  setValue: (String? value) {
                    courseCode = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: ['Name 1', 'Name 2', 'Name 3', 'Name 4'],
                  selectionDescription: 'Select Course Name',
                  setValue: (String? value) {
                    courseName = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: [
                    'Location 1',
                    'Location 2',
                    'Location 3',
                    'Location 4'
                  ],
                  selectionDescription: 'Select Hall Location',
                  setValue: (String? value) {
                    hallLocation = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: [
                    'Description 1',
                    'Description 2',
                    'Description 3',
                    'Description 4'
                  ],
                  selectionDescription: 'Select Course Description',
                  setValue: (String? value) {
                    courseDescription = value!;
                  },
                ),
                SizedBox(height: 16),
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
                //Navigator.pop(context); // Close the dialog
                printVariables();
              },
              child: Text('Add  lecture'),
            ),
          ],
        );
      },
    );
  }

  set endTime(String value) {
    _endTime = value;
  }

  set hallLocation(String value) {
    _hallLocation = value;
  }

  set courseName(String value) {
    _courseName = value;
  }

  set term(String value) {
    _term = value;
  }

  set groupName(String value) {
    _groupName = value;
  }

  set instructorName(String value) {
    _instructorName = value;
  }

  set courseDescription(String value) {
    _courseDescription = value;
  }

  set department(String value) {
    _department = value;
  }

  set courseCode(String value) {
    _courseCode = value;
  }

  set startTime(String value) {
    _startTime = value;
  }

  void printVariables() {
    print('_courseCode: $_courseCode');
    print('_startTime: $_startTime');
    print('_endTime: $_endTime');
    print('_hallLocation: $_hallLocation');
    print('_courseName: $_courseName');
    print('_term: $_term');
    print('_groupName: $_groupName');
    print('_instructorName: $_instructorName');
    print('_courseDescription: $_courseDescription');
    print('_department: $_department');
  }
}
