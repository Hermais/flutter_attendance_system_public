
import 'package:flutter/material.dart';

import '../../../widgets/card_widget.dart';
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


  List<Widget> provideWidgetOptions() => <Widget>[
    SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoCard(cardTitle: "Week 1", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 2",isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 3", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 4", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 5", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 6", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 7", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 8", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 9", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 10", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 11", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
          InfoCard(cardTitle: "Week 12", isLectureCard: false, isButtonVisible: false, cardDescription: "",cardThumbnail: const Icon(Icons.check),),
      
        ],
      ),
    ),
    const Center(child: Text('Gives information of the whereabouts of the student.')),
  ];

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
        onPressed: () {const StudentAndParentInfo().studentInfoPopup(context: context);},
        child: const Icon(Icons.question_mark),
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
