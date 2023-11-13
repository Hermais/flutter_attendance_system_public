// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/qr_apis/qr_app.dart';
import 'package:flutter_attendance_system/users_pages/utilities/card_widget.dart';
import 'package:google_fonts/google_fonts.dart';

void temp() {}

class InstructorDashboard extends StatefulWidget {
  final String? adminName;
  final Widget? appBarFlexableSpace;


  InstructorDashboard({super.key, this.adminName, this.appBarFlexableSpace});

  @override
  _InstructorDashboardState createState() => _InstructorDashboardState();
}

class _InstructorDashboardState extends State<InstructorDashboard> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    /// Lectures Tab:
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


    Text('Cards for students will appear here.'),
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
flexibleSpace: widget.appBarFlexableSpace,
        title: Text(
          'Welcome, ${widget.adminName ?? "Instructor!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QRScannerWithScaffold(appBarFlexableSpace: widget.appBarFlexableSpace,
                storeScanResult: temp,
              ),
            ),
          );
        },
        child: Icon(Icons.qr_code_scanner),
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
            icon: Icon(Icons.dashboard_rounded),
            label: 'Lectures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Attending Students',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
