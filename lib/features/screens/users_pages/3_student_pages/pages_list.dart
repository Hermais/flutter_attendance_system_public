import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions(BuildContext context) {
  return <Widget>[
    /// Lectures Tab:
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),
          InfoCard(buttonText: "Attend", onButtonTap: () => showQRCodePopup(context)),

        ],
      ),
    ),

    /// Instructors Tab:
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
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 1",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,

            cardThumbnail: const Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 2",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,

            cardThumbnail: const Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 3",
          ),
          InfoCard(
            isLectureCard: false,
            isButtonVisible: false,
            isTopLeftBorderMaxRadius: false,

            cardThumbnail: const Icon(Icons.person),
            cardDescription: "The whereabouts of the instructor will be here.",
            cardTitle: "Instructor 4",
          ),
        ],
      ),
    ),

    /// Timetable Tab:
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Sunday",
              cardDescription: "No lectures today.",
              cardThumbnail: const Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Monday",
              cardDescription: "No lectures today.",
              cardThumbnail: const Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Tuesday",
              cardDescription: "No lectures today.",
              cardThumbnail: const Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Wednesday",
              cardDescription: "No lectures today.",
              cardThumbnail: const Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Thursday",
              cardDescription: "No lectures today.",
              cardThumbnail: const Icon(Icons.table_chart)),
          InfoCard(
              isButtonVisible: false,
              isLectureCard: false,
              cardTitle: "Saturday",
              cardDescription: "No lectures today.",
              cardThumbnail: const Icon(Icons.table_chart)),
        ],
      ),
    ),
  ];
}

Future<void> showQRCodePopup(BuildContext context,{double? edgeLength, String? qrData}) async {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  if (deviceWidth > deviceHeight) {
    edgeLength = deviceWidth * 0.3;
  } else {
    edgeLength = deviceHeight * 0.3;
  }
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:
        const Text('Scan Your QR Code from your instructor\'s device.'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: edgeLength,
                  width: edgeLength,
                  child: QrImageView(
                      data: qrData ?? "data",
                      size: 300.0,
                      version: QrVersions.auto))
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}