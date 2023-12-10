
import 'package:flutter/material.dart';

import '../../../widgets/card_widget.dart';
import '../3_student_pages/pages_list.dart';
import '../commons/student_info_popup.dart';



void temp(){}


class ParentDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  const ParentDashboard({super.key, this.userName, this.appBarFlexibleSpace});
  @override
  ParentDashboardState createState() => ParentDashboardState();
}

class ParentDashboardState extends State<ParentDashboard> {
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
        title: Text('Welcome, ${widget.userName ?? "Parent!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,

        onPressed: () {const StudentAndParentInfo().studentInfoPopup(context: context);},
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
