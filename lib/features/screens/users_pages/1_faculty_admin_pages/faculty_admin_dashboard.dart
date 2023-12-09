

// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/1_faculty_admin_pages/pages_list.dart';
import 'package:flutter_attendance_system/features/widgets/multi_drop_down_button.dart';

import '../../../widgets/drop_down_button.dart';
import '../../../widgets/text_button_calendar_viewer.dart';
import '../../../widgets/text_button_clock_viewer.dart';

class FacultyAdminDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  const FacultyAdminDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  FacultyAdminDashboardState createState() => FacultyAdminDashboardState();
}

class FacultyAdminDashboardState extends State<FacultyAdminDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

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
  String? _studentDateOfBirth;
  String? _studentFirstName;
  String? _studentLastName;
  String? _studentUniversityID;
  String? _studentNationalID;
  String? _studentAcademicYear;
  String? _parentID;
  String? _instructorDateOfBirth;
  String? _instructorFirstName;
  String? _instructorLastName;
  String? _instructorUniversityID;
  String? _instructorNationalID;
  List<String>? _instructorDepartment;
  bool? _isFloatingActionButtonVisible;



  void _onItemTapped(int index) {
    setState(() {
      _isFloatingActionButtonVisible = true;
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text(
          'Welcome, ${widget.userName ?? "Faculty Admin!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedIndex ==0 ? _showTimetablesDialog : _showInstructorsDialog,
        child: const Icon(Icons.settings_suggest),
      ),

      body: PageView(
        controller: _pageController,
        children: provideWidgetOptions(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
           // _isFloatingActionButtonVisible = _selectedIndex==0;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 17,
        iconSize: 30,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const <BottomNavigationBarItem>[
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

  Future<void> _showTimetablesDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Lecture'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Specify Main Properties:'),
                DropdownButtonWidget<String>(
                  items: const ['CSE', 'Mechanics', 'Power'],
                  selectionDescription: 'Select Department',
                  setValue: (String? value) {
                    department = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: const [
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
                  items: const ['Term 1', 'Term 2'],
                  selectionDescription: 'Select Term',
                  setValue: (String? value) {
                    term = value!;
                  },
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const Text('Select Lecture Details:'),
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
                  items: const [
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
                  items: const ['Code 1', 'Code 2', 'Code 3', 'Code 4'],
                  selectionDescription: 'Select Course Code',
                  setValue: (String? value) {
                    courseCode = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: const ['Name 1', 'Name 2', 'Name 3', 'Name 4'],
                  selectionDescription: 'Select Course Name',
                  setValue: (String? value) {
                    courseName = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: const [
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
                  items: const [
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
                const SizedBox(height: 16),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Do something with the entered data
                //Navigator.pop(context); // Close the dialog
                printVariables();
              },
              child: const Text('Add  lecture'),
            ),
          ],
        );
      },
    );
  }
  Future<void> _showInstructorsDialog() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    width: 116,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: (){
                        _showAddInstructorDialog();
                      },
                      child:const Text(
                        'Add Instructor',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 40,
                    width: 116,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: (){
                        _showAddStudentDialog();
                      },
                      child:const Text(
                        'Add Student',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 40,
                    width: 116,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child:const Text(
                        'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Future<void> _showAddInstructorDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Instructor',
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _instructorFirstName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _instructorLastName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _instructorUniversityID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'University ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _instructorNationalID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                DatePickerButton(
                  selectedDate: 'Select Date Of Birth',
                  setChangedDate: (date) {
                    setState(() {
                      _instructorDateOfBirth = date;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                MultiSelectDropdownWidget<String>(
                  items: const [
                    'math_1',
                    'math_2',
                    'math_3',
                    'math_4',
                    'math_5',
                    'math_6',
                    'math_7',
                    'math_8',
                  ],
                  selectionDescription: ' Courses Of instructor',
                  setValues: (List<String>? values) {
                    _instructorDepartment=values;
                    //print('Selected Values: $values');
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Do something with the entered data
                //Navigator.pop(context); // Close the dialog
              },
              child: const Text('Add Instructor'),
            ),
          ],
        );
      },
    );
  }
  Future<void> _showAddStudentDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Student',
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _studentFirstName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _studentLastName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _studentUniversityID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'University ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _studentNationalID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                DatePickerButton(
                  selectedDate: 'Select Date Of Birth',
                  setChangedDate: (date) {
                    setState(() {
                      _studentDateOfBirth = date;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                DropdownButtonWidget<String>(
                  items: const [
                    'CSE1',
                    'CSE2',
                    'CSE3',
                    'CSE4',
                    'prep',
                    'Power1',
                    'Power2',
                    'Power3',
                    'Power4'
                  ],
                  selectionDescription: 'Select Academic Year',
                  setValue: (String? value) {
                    _studentAcademicYear = value!;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _parentID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Parent ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Do something with the entered data
                //Navigator.pop(context); // Close the dialog
              },
              child: const Text('Add Student'),
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
