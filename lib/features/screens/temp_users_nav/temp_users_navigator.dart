import 'package:flutter/material.dart';

import '../../../shared/constants_and_statics/shared_vars.dart';
import '../../widgets/card_widget.dart';

class NoLoginNavigation extends StatelessWidget {

  const NoLoginNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Public Navigator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: false,
              child: InfoCard(
                cardThumbnail: const Icon(Icons.developer_mode),
                cardTitle: "Developer Admin",
                isLectureCard: false,
                onTap: () {
                  Navigator.of(context).pushNamed(developerAdmin);
                },
              ),
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.admin_panel_settings),
              cardTitle: "Faculty Admin",
              isLectureCard: false,

              onTap: () {

                Navigator.of(context).pushNamed(facultyAdmin);
              },
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.supervised_user_circle),
              cardTitle: "Student",
              isLectureCard: false,

              onTap: () {
                Navigator.of(context).pushNamed(student);
              },
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.supervisor_account),
              cardTitle: "Parent",
              isLectureCard: false,

              onTap: () {
                Navigator.of(context).pushNamed(parent);
              },
            ),
            InfoCard(
              cardThumbnail: const Icon(Icons.person),
              cardTitle: "Instructor",
              isLectureCard: false,
              onTap: () {
                Navigator.of(context).pushNamed(instructor);
              },
            ),
          ],
        ),
      ),
    );
  }

  // void _navigateToPage(BuildContext context, Widget page) {
  //   Navigator.of(context).push(PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => page,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(0.0, 1.0);
  //       const end = Offset.zero;
  //       const curve = Curves.easeInOut;
  //       var curveTween = CurveTween(curve: curve);
  //       var tween = Tween(begin: begin, end: end).chain(curveTween);
  //       var offsetAnimation = animation.drive(tween);
  //
  //       return SlideTransition(
  //         position: offsetAnimation,
  //         child: child,
  //       );
  //     },
  //   ));
  // }
}
