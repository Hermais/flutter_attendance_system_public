import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/3_student_pages/student_pages_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/auth_cubit.dart';
import '../../../../core/cubits/lecture_manager_cubit.dart';
import '../../../../core/cubits/student_cubit.dart';
import '../../../../core/data/repositories/student_repository.dart';
import '../../../../core/data/services/student_web_services.dart';
import '../../../../main.dart';
import '../../../widgets/bottom_navigation_bar.dart';
import '../commons/student_info_popup.dart';

void temp() {}

StudentCubit studentCubit = StudentCubit(
    studentRepository:
    StudentRepository(studentWebServices: StudentWebServices()))
  ..loadStudentById((authCubit.state as AuthSuccess).authGet.id);



class StudentDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  const StudentDashboard({super.key, this.userName, this.appBarFlexibleSpace});

  @override
  StudentDashboardState createState() => StudentDashboardState();
}

class StudentDashboardState extends State<StudentDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
          index, duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    final LectureManagerCubit studentLectureManagerCubit =
    LectureManagerCubit();
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) =>studentCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(


          title: BlocBuilder<StudentCubit, StudentState>(
            builder: (context, studentState) {
              if (studentState is StudentLoaded) {
                return Text(
                  'Welcome, ${studentState.students[0].firstName ??
                      "Student!"}',
                );
              } else {
                return const Text('Welcome, Student!');
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme
              .of(context)
              .primaryColor,

          onPressed: () {
            const StudentAndParentInfo(isForStudent: true).studentInfoPopup(
                context: context);
          },
          child: const Icon(Icons.question_mark),
        ),
        body: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, studentState) {
            if (studentState is StudentLoaded) {
              return PageView(
                controller: _pageController,
                children: provideWidgetOptions(context, studentLectureManagerCubit),
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),

        bottomNavigationBar: CustomBottomNavigationBar(
          items: <FlashyTabBarItem>[
            FlashyTabBarItem(
              icon: const Icon(Icons.dashboard_rounded),
              title: const Text('Lectures'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.calendar_month_rounded),
              title: const Text('My Timetable'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.supervisor_account),
              title: const Text('Instructors'),
            ),
          ],
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }


}
