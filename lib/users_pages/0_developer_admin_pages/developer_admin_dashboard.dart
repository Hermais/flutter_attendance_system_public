// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class DeveloperAdminDashboard extends StatefulWidget {
  final String? adminName;
  final Widget? appBarFlexableSpace;
  DeveloperAdminDashboard({super.key, this.adminName, this.appBarFlexableSpace});
  @override
  _DeveloperAdminDashboardState createState() => _DeveloperAdminDashboardState();
}

class _DeveloperAdminDashboardState extends State<DeveloperAdminDashboard> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Tab 1 Content'),
    Text('Tab 2 Content'),
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
        flexibleSpace: widget.appBarFlexableSpace,
        elevation: 0,

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_sharp))
        ],


        title: Text('Welcome, ${widget.adminName ?? "Developer!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.settings_suggest),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
