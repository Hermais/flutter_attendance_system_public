// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/card_widget.dart';



class FacultyAdminDashboard extends StatefulWidget {
  final String? adminName;
  final Widget? appBarFlexableSpace;
  FacultyAdminDashboard({super.key, this.adminName, this.appBarFlexableSpace});
  @override
  _FacultyAdminDashboardState createState() => _FacultyAdminDashboardState();
}

class _FacultyAdminDashboardState extends State<FacultyAdminDashboard> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Text('Faculty timetable should be here.'),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),
        CustomCard(),

      ],
    ),
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
        elevation: 0,
flexibleSpace: widget.appBarFlexableSpace,
        title: Text('Welcome, ${widget.adminName ?? "Faculty Admin!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.settings_suggest),
      ),
      body: SingleChildScrollView(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[ _widgetOptions.elementAt(_selectedIndex)],
      ),),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 17,
        iconSize: 30,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(


            icon: Icon(Icons.calendar_month_rounded),
            label: 'All Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_rounded),
            label: 'Info',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
