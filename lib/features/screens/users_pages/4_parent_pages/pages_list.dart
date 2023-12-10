import 'package:flutter/material.dart';

import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions(BuildContext context) => <Widget>[
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