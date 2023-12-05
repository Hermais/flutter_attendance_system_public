import 'package:flutter/material.dart';

import '../utilities/custom_widgets/card_widget.dart';

List<Widget> provideWidgetOptions() => <Widget>[
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
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
          "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 1",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
          "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 2",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
          "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 3",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.table_chart),
          cardDescription:
          "Here a small description of the timetable is supplied.",
          cardTitle: "Timetable 4",
        ),
      ],
    ),
  ),
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
          cardDescription:
          "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 1",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription:
          "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 2",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription:
          "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 3",
        ),
        InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardHeight: 100,
          cardThumbnail: const Icon(Icons.person),
          cardDescription:
          "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor 4",
        ),
      ],
    ),
  ),
];