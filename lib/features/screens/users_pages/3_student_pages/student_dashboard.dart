
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/3_student_pages/pages_list.dart';
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




}
