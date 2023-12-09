
import 'package:flutter/material.dart';

class DeveloperAdminDashboard extends StatefulWidget {
  final String? userName;

  const DeveloperAdminDashboard({super.key, this.userName});

  @override
  DeveloperAdminDashboardState createState() => DeveloperAdminDashboardState();
}

class DeveloperAdminDashboardState extends State<DeveloperAdminDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> provideWidgetOptions() =>
      <Widget>[
        const Center(child: Text('Tab 1 Content')),
        const Center(child: Text('Tab 2 Content')),
      ];

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_sharp))
        ],
        title: Text(
          'Welcome, ${widget.userName ?? "Developer!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Modify a table.',
        child: const Icon(Icons.settings_suggest),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'All Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme
            .of(context)
            .primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

// Create a dialog to show to allow to modify, add, or delete a faculty table.

// The faculty table is chosen by week from a dropdown menu.
// Then we can choose to add, modify, or delete a lecture.
// If we choose to add a lecture, we can choose the day, time, and room.

}
