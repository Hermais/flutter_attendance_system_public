// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/qr_apis/qr_app.dart';
import 'package:google_fonts/google_fonts.dart';


void temp(){}


class StudentDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  StudentDashboard({super.key, this.userName, this.appBarFlexibleSpace});
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Lectures (or sections) for the student shall appear here. Lectures appear in cards.'),
    Text('Undefined tab functionality.'),
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
flexibleSpace: widget.appBarFlexibleSpace,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],


        title: Text('Welcome, ${widget.userName ?? "Student!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.question_mark),
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


            icon: Icon(Icons.dashboard_rounded),
            label: 'Lectures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'TBD',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
