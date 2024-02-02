import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/auth_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/instructor_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/qr_scanner_cubit.dart';
import 'package:flutter_attendance_system/features/widgets/bottom_navigation_bar.dart';
import 'package:flutter_attendance_system/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/lecture_manager_cubit.dart';
import '../../../../core/data/repositories/instructor_repository.dart';
import '../../../../core/data/services/instructor_web_services.dart';
import '../../../widgets/connectivity_listener.dart';
import '../../qr_page/qr_app.dart';
import 'instructor_pages_list.dart';

void temp(String result) {
  print(result);
}

class InstructorDashboard extends StatefulWidget {
  final String? userName;
  final Widget? appBarFlexibleSpace;

  const InstructorDashboard(
      {super.key, this.userName, this.appBarFlexibleSpace});

  @override
  InstructorDashboardState createState() => InstructorDashboardState();
}

class InstructorDashboardState extends State<InstructorDashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final InstructorCubit instructorCubit = InstructorCubit(
      instructorRepository:
      InstructorRepository(instructorWebServices: InstructorWebServices()))
    ..loadInstructorById((authCubit.state as AuthSuccess).authGet.id);
  final QrScannerCubit qrScannerCubit = QrScannerCubit(instructorWebServices: InstructorWebServices());
  final LectureManagerCubit instructorLectureManagerCubit =
  LectureManagerCubit();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {


    return ConnectivityListener(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => instructorCubit,
          ),
          BlocProvider(
            create: (context) => qrScannerCubit,
          ),
        ],
        child: Scaffold(
            appBar: AppBar(
              actions: [
                BlocProvider(
                  create: (context) => BlocProvider.of<QrScannerCubit>(context),
                  child: IconButton(
                    onPressed: () {
                      if (instructorLectureManagerCubit.state
                      is LectureManagerInSession) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return BlocProvider.value(
                              value: qrScannerCubit,
                              child: QRScannerWithScaffold(
                                storeScanResult: verifyAttendance,
                                qrAppTitle: "Scan QR code to track attendance:",
                              ),
                            );
                          }),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("No lecture is selected."),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                  ),
                ),
              ],
              title: BlocBuilder<InstructorCubit, InstructorState>(
                builder: (context, instructorState) {
                  if (instructorState is InstructorLoaded) {
                    return Text(
                      'Welcome, Dr. ${instructorState.instructors![0]
                          .firstName ??
                          "Instructor!"}',
                    );
                  } else {
                    return const Text('Welcome, Instructor!');
                  }
                },
              ),
            ),
            body: PageView(
              controller: _pageController,
              children:
              provideWidgetOptions(context, instructorLectureManagerCubit),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              items: <FlashyTabBarItem>[
                FlashyTabBarItem(
                  icon: const Icon(Icons.dashboard_rounded),
                  title: const Text('Lectures'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.people),
                  title: const Text('Students'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.checklist),
                  title: const Text('Attendance'),
                ),
              ],
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            )),
      ),
    );
  }

// Create a confirmation popup for the instructor again.

  verifyAttendance(String qrScanResult){
    qrScannerCubit.catchQrCode(qrScanResult, instructorLectureManagerCubit );
  }
}
