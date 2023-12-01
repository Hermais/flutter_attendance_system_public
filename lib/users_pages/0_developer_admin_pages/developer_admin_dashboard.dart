// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class DeveloperAdminDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  DeveloperAdminDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  DeveloperAdminDashboardState createState() =>
      DeveloperAdminDashboardState();
}

class DeveloperAdminDashboardState extends State<DeveloperAdminDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);


  List<Widget> provideWidgetOptions() => <Widget>[
    Center(child: Text('Tab 1 Content')),
    Center(child: Text('Tab 2 Content')),
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
        flexibleSpace: widget.appBarFlexibleSpace,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_sharp))
        ],
        title: Text(
          'Welcome, ${widget.userName ?? "Developer!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            icon: Icon(Icons.supervised_user_circle),
            label: 'All Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

