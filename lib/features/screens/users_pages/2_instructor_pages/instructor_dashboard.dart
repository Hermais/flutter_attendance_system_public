import 'package:flutter/material.dart';

import '../../qr_page/qr_app.dart';
import 'instructor_pages_list.dart';

void temp() {}

class InstructorDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  const InstructorDashboard(
      {super.key, this.userName, this.appBarFlexibleSpace});

  @override
  InstructorDashboardState createState() => InstructorDashboardState();
}

class InstructorDashboardState extends State<InstructorDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const QRScannerWithScaffold(
                    storeScanResult: temp,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ],
        title: Text(
          'Welcome, ${widget.userName ?? "Instructor!"}',
        ),
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

// Create a confirmation popup for the instructor again.
}
