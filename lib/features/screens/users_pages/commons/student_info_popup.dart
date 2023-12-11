import 'package:flutter/material.dart';

import '../../../widgets/card_widget.dart';

class StudentAndParentInfo extends StatelessWidget{
  final bool? isForStudent;
  const StudentAndParentInfo({super.key, this.isForStudent});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Create a card with title "Student Info".
        InfoCard.bland(
          cardThumbnail: const Icon(Icons.info),
          cardTitle: "Student Info",
          cardDescription: "",
        ),
        InfoCard.bland(
          cardThumbnail: const Icon(Icons.drive_file_rename_outline),
          cardTitle: "Name",
          cardDescription: "Sheldon Lee Cooper",
        ),
        InfoCard.bland(
          cardThumbnail: const Icon(Icons.person),
          cardTitle: "ID",
          cardDescription: "123456789",
        ),
        InfoCard.bland(
          cardThumbnail: const Icon(Icons.email),
          cardTitle: "Email",
          cardDescription: "example@domain.com",
        ),
        InfoCard.bland(
          cardThumbnail: const Icon(Icons.phone),
          cardTitle: "Phone Number",
          cardDescription: "0591234567",
        ),
        Visibility(
          visible: isForStudent ?? false,
          child: InfoCard.bland(
            cardThumbnail: const Icon(Icons.person),
            cardTitle: "User Name",
            cardDescription: "StudentUserName",
          ),
        ),
        Visibility(
          visible: isForStudent ?? false ,
          child: InfoCard.bland(
            cardThumbnail: const Icon(Icons.lock),
            cardTitle: "Password",
            cardDescription: "StudentPassword",
          ),
        ),

        InfoCard.bland(
          cardThumbnail: const Icon(Icons.calendar_today),
          cardTitle: "Academic Year",
          cardDescription: "2021-2022 CSE 2",
          buttonText: "Close",
          isButtonVisible: true,
          onButtonTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }


  Future<void> studentInfoPopup({double? edgeLength,  required BuildContext context}) async {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    if (deviceWidth > deviceHeight) {
      /// Wide screen so take the device width as function for the edge length.
      edgeLength = deviceWidth * 0.8;
    } else {
      edgeLength = deviceWidth;
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:  SingleChildScrollView(
            child: StudentAndParentInfo(isForStudent: isForStudent,),
          ),
        );
      },
    );
  }
}