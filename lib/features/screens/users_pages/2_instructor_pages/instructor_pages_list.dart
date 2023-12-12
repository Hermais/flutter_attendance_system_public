import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/lecture_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/services/lecture_web_services.dart';
import '../../../../shared/constants_and_statics/shared_vars.dart';
import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions(BuildContext context) => <Widget>[
      /// Lectures Tab:
      BlocProvider(
        create: (context) => LectureCubit(
            lectureRepository:
                LectureRepository(lectureWebServices: LectureWebServices())),
        child: BlocBuilder<LectureCubit, LectureState>(
          builder: (context, state) {
            if (state is LectureDefault) {
              BlocProvider.of<LectureCubit>(context).loadDefault();

              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(itemBuilder: (context, index) {
              return InfoCard(
                isLectureCard: true,
                isButtonVisible: true,
                isTopLeftBorderMaxRadius: true,
                cardThumbnail: const Icon(Icons.account_box),
                cardDescription: "Description of the lecture will be here.",
                cardTitle: "Lecture ${index + 1}",
                buttonText: "Start Lecture",
                onButtonTap: () {
                  // this method will be updated to take a lecture id as a parameter.
                  showLectureStartConfirmationPopup(context);
                },
              );
            });
          },
        ),
      ),

      /// Students Tab:
      ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,
            cardThumbnail: const Icon(Icons.person),
            cardDescription:
                "This will be the course that the instructor is assigned to. And when"
                " it is tapped on it show the page of the students of "
                "that students of that course.",
            cardTitle: "Instructor's Assigned Course ${index + 1}",
            onTap: () {
              Navigator.of(context).pushNamed(
                  instructorStudentsByApplicableCourses,
                  arguments: "Instructor's Assigned Course ${index + 1}");
            },
          );
        },
      ),
    ];

Future<void> showLectureStartConfirmationPopup(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Lecture Start Confirmation"),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Are you sure you want to start this lecture? "
                  "The lecture can be terminated at least after 30 minutes."),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Confirm"),
            onPressed: () {
              // TODO: implement lecture start by sending a request to the server.
              Navigator.of(context).pop();
              // make a snack bar to show that the lecture has started.
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: const Text("Lecture has started."),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
