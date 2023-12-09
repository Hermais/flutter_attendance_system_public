// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';


import '../../../widgets/card_widget.dart';
import '../../qr_page/qr_app.dart';

void temp() {}


class InstructorDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;


  const InstructorDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  InstructorDashboardState createState() => InstructorDashboardState();
}

class InstructorDashboardState extends State<InstructorDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);


  List<Widget> provideWidgetOptions()=> <Widget>[
    /// Lectures Tab:
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
          InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(),),
      
      
        ],
      ),
    ),

  /// Students Tab:
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.person),
            cardDescription: "Info about the student's attendance will be here (Attending "
                "now or not).",
            cardTitle: "Student 1",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.person),
            cardDescription: "Info about the student's attendance will be here (Attending "
                "now or not).",
            cardTitle: "Student 2",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.person),
            cardDescription: "Info about the student's attendance will be here (Attending "
                "now or not).",
            cardTitle: "Student 3",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardHeight: 100,
            cardThumbnail: const Icon(Icons.person),
            cardDescription: "Info about the student's attendance will be here (Attending "
                "now or not).",
            cardTitle: "Student 4",
          ),
      
        ],
      ),
    )
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
        elevation: 0,
flexibleSpace: widget.appBarFlexibleSpace,
        title: Text(
          'Welcome, ${widget.userName ?? "Instructor!"}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QRScannerWithScaffold(appBarFlexibleSpace: widget.appBarFlexibleSpace,
                storeScanResult: temp,
              ),
            ),
          );
        },
        child: Icon(Icons.qr_code_scanner),
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

Future<void> showLectureStartConfirmationPopup() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Lecture Start Confirmation"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Are you sure you want to start this lecture? "
                  "The lecture can be terminated at least after 30 minutes."),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Confirm"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );}
}
