import 'package:flutter/material.dart';

import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions(BuildContext context)=> <Widget>[
  /// Lectures Tab:
  SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),
        InfoCard(buttonText: "Start",onButtonTap: ()=>showLectureStartConfirmationPopup(context),),


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

          cardThumbnail: const Icon(Icons.person),
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 1",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,

          cardThumbnail: const Icon(Icons.person),
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 2",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,

          cardThumbnail: const Icon(Icons.person),
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 3",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,

          cardThumbnail: const Icon(Icons.person),
          cardDescription: "Info about the student's attendance will be here (Attending "
              "now or not).",
          cardTitle: "Student 4",
        ),

      ],
    ),
  )
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
              Navigator.of(context).pop();
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
  );}