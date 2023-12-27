import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/parent_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/parent_repository.dart';
import 'package:flutter_attendance_system/features/widgets/bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/auth_cubit.dart';
import '../../../../core/data/services/parent_web_services.dart';
import '../../../../main.dart';
import '../4_parent_pages/pages_list.dart';


void temp() {}


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
    return BlocProvider(
      create: (context) =>
      ParentCubit(parentRepository: ParentRepository(
          parentWebServices: ParentWebServices()))
        ..loadParentById((authCubit.state as AuthSuccess).authGet.id),
      child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<ParentCubit, ParentState>(
              builder: (context, parentState) {
                if (parentState is ParentLoaded) {
                  return Text(
                    'Welcome, ${parentState.parents[0].firstName ?? "Parent!"}',
                  );
                } else {
                  return const Text('Welcome, Parent!');
                }
              },
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Theme.of(context).primaryColor,
          //
          //   onPressed: () {const StudentAndParentInfo().studentInfoPopup(context: context);},
          //   child: const Icon(Icons.question_mark),
          // ),
          body: PageView(
            controller: _pageController,
            children: provideWidgetOptions(context),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            items: <FlashyTabBarItem>[
              FlashyTabBarItem(


                icon: const Icon(Icons.checklist),
                title: const Text('Attendance Record'),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.pin_drop_rounded),
                title: const Text('Student Whereabouts'),
              ),

            ],
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          )
      ),
    );
  }
}
