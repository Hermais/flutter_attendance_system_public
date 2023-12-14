
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/3_student_pages/pages_list.dart';

import '../../../widgets/bottom_navigation_bar.dart';
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

      bottomNavigationBar: CustomBottomNavigationBar(
        items: <FlashyTabBarItem>[
          FlashyTabBarItem(
            icon: const Icon(Icons.dashboard_rounded),
            title: const Text('Lectures'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.supervisor_account),
            title: const Text('Instructors'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.calendar_month_rounded),
            title: const Text('My Timetable'),
          ),
        ],
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }




}
