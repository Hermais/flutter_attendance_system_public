// ignore_for_file: unused_field, avoid_print

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/faculty_admin_cubit.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/1_faculty_admin_pages/faculty_admin_popups.dart';
import 'package:flutter_attendance_system/features/widgets/bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/auth_cubit.dart';
import '../../../../core/data/repositories/faculty_admin_repository.dart';
import '../../../../core/data/services/faculty_admin_web_services.dart';
import '../../../../main.dart';
import 'faculty_admin_pages_list.dart';

class FacultyAdminDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  const FacultyAdminDashboard(
      {super.key, this.userName, this.appBarFlexibleSpace});

  @override
  FacultyAdminDashboardState createState() => FacultyAdminDashboardState();
}

class FacultyAdminDashboardState extends State<FacultyAdminDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  String? _courseCode;
  String? _startTime;
  String? _endTime;
  String? _hallLocation;
  String? _courseName;
  String? _term;
  String? _groupName;
  String? _instructorName;
  String? _courseDescription;
  String? _department;
  String? _studentDateOfBirth;
  String? _studentFirstName;
  String? _studentLastName;
  String? _studentUniversityID;
  String? _studentNationalID;
  String? _studentAcademicYear;
  String? _parentID;
  String? _instructorDateOfBirth;
  String? _instructorFirstName;
  String? _instructorLastName;
  String? _instructorUniversityID;
  String? _instructorNationalID;
  List<String>? _instructorDepartment;
  bool? _isFloatingActionButtonVisible;
  String? _lectureStartDate;

  void _onItemTapped(int index) {
    setState(() {
      _isFloatingActionButtonVisible = true;
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FacultyAdminCubit(
          facultyAdminRepository: FacultyAdminRepository(
              facultyAdminWebServices: FacultyAdminWebServices()))
        ..getFacultyAdminById((authCubit.state as AuthSuccess).authGet.id),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<FacultyAdminCubit, FacultyAdminState>(
            builder: (context, facultyAdminState) {
              if (facultyAdminState is FacultyAdminLoaded) {
                return Text(
                  'Welcome, ${facultyAdminState.facultyAdmin[0].firstName ?? "Faculty Admin!"}',
                );
              } else {
                return const Text('Welcome, Faculty Admin!');
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            FacultyAdminPopups facultyAdminPopups =
                FacultyAdminPopups(mainContext: context, setState: setState);
            _selectedIndex == 0
                ? facultyAdminPopups.showAddLectureDialog()
                : facultyAdminPopups.showAddEntitiesDialog();
          },
          child: const Icon(Icons.settings_suggest),
        ),
        body: PageView(
          controller: _pageController,
          children: provideWidgetOptions(context),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
              // _isFloatingActionButtonVisible = _selectedIndex==0;
            });
          },
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: _onItemTapped,
          selectedIndex: _selectedIndex,
          items: <FlashyTabBarItem>[
            FlashyTabBarItem(
              icon: const Icon(Icons.calendar_month_rounded),
              title: const Text('Timetables'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.supervisor_account),
              title: const Text('Instructors'),
            ),
          ],
        ),
      ),
    );
  }
}
