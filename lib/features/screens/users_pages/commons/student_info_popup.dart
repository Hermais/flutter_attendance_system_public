import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/student_cubit.dart';
import '../../../../core/data/models/student_model.dart';
import '../../../widgets/card_widget.dart';
import '../../login_page/login.dart';
import '../3_student_pages/student_dashboard.dart';



Student student = (studentCubit!.state as StudentLoaded).students[0];

class StudentAndParentInfo extends StatelessWidget{
  final bool? isForStudent;
  const StudentAndParentInfo({super.key, this.isForStudent});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => studentCubit!,
  child: BlocBuilder<StudentCubit, StudentState >(
  builder: (context, state) {
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
          cardDescription: "${student.firstName} ${student.lastName}",
        ),
        InfoCard.bland(
          cardThumbnail: const Icon(Icons.person),
          cardTitle: "National ID",
          cardDescription: student.nationalId,
        ),
        InfoCard.bland(
          cardThumbnail: const Icon(Icons.date_range),
          cardTitle: "Date of Birth",
          cardDescription: student.dateOfBirth.toString().substring(0,10),
        ),

        InfoCard.bland(
          cardThumbnail: const Icon(Icons.email),
          cardTitle: "Email",
          cardDescription: student.emailId,
        ),
        Visibility(
          visible: isForStudent ?? false,
          child: InfoCard.bland(
            cardThumbnail: const Icon(Icons.person),
            cardTitle: "User Name",
            cardDescription: student.emailId,
          ),
        ),
        Visibility(
          visible: isForStudent ?? false ,
          child: InfoCard.bland(
            cardThumbnail: const Icon(Icons.lock),
            cardTitle: "Password",
            cardDescription: student.nationalId,
          ),
        ),

        InfoCard.bland(
          cardThumbnail: const Icon(Icons.book),
          cardTitle: "Academic Year",
          cardDescription: '${student.department}, ${academicYears[student.studyYear!]}',
          buttonText: "Close",
          isButtonVisible: true,
          onButtonTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
),
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