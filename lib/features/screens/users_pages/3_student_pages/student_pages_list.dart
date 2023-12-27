import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/instructor_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_manager_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/lecture_repository.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/3_student_pages/student_dashboard.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/3_student_pages/student_timetable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/cubits/auth_cubit.dart';
import '../../../../core/cubits/internet_cubit.dart';
import '../../../../core/cubits/student_cubit.dart';
import '../../../../core/data/repositories/instructor_repository.dart';
import '../../../../core/data/repositories/student_repository.dart';
import '../../../../core/data/services/instructor_web_services.dart';
import '../../../../core/data/services/lecture_web_services.dart';
import '../../../../core/data/services/student_web_services.dart';
import '../../../../main.dart';
import '../../../../shared/constants_and_statics/shared_vars.dart';
import '../../../widgets/card_widget.dart';
import '../../login_page/login.dart';

InstructorCubit instructorCubit = InstructorCubit(
    instructorRepository:
        InstructorRepository(instructorWebServices: InstructorWebServices()))
  ..loadInstructorsByStudentId((authCubit.state as AuthSuccess).authGet.id);








List<Widget> provideWidgetOptions(BuildContext mainContext) {

  return <Widget>[
    /// Lectures Tab:
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => studentCubit!),
        BlocProvider(
          create: (context) => BlocProvider.of<LectureManagerCubit>(mainContext),
        ),

        BlocProvider(
          create: (context) => LectureCubit(
              lectureRepository:
              LectureRepository(lectureWebServices: LectureWebServices()))..getLecturesByDay(
              day: 'monday',
              department:
              (studentCubit!.state as StudentLoaded).students[0].department!,
              academicYear: (studentCubit!.state as StudentLoaded)
                  .students[0]
                  .studyYear!)

        ),

      ],
      child: BlocListener<LectureManagerCubit, LectureManagerState>(

        listener: (context, lectureManagerState) {
          if (lectureManagerState is LectureManagerInSession) {
            showQRCodePopup(context);
          } else if (lectureManagerState is LectureManagerFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("This lecture is not in session."),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.red,
              ),
            );
          }

        },
        child: BlocBuilder<LectureCubit, LectureState>(
          builder: (context, lectureState) {
            if (lectureState is LectureInitial) {

              return const Center(
                child: CircularProgressIndicator(),
              );

            }
            if (lectureState is LectureLoaded || lectureState is LectureDefault) {
              print(DateTime.now().timeZoneName);
              return ListView.builder(
                  itemCount: lectureState.lectureList.length,
                  itemBuilder: (context, index) {
                    return InfoCard(
                      cardThumbnail: const Icon(Icons.book),
                      cardTitle: lectureState.lectureList[index].courseCode,
                      lectureStartsAt: DateFormat("hh:mm a")
                          .format(lectureState.lectureList[index].startTime!),
                      lectureEndsAt: DateFormat("hh:mm a")
                          .format(lectureState.lectureList[index].endTime!),
                      lecturePlace:
                          lectureState.lectureList[index].hallLocation.toString(),
                      buttonText: "Attend",
                      onButtonTap: () {
                        BlocProvider.of<LectureManagerCubit>(mainContext)
                            .checkLectureToStart(lectureState.lectureList[index]);
                      },
                    );
                  });
            }
            return const Center(
              child: Text("Error"),
            );
          },
        ),
      ),
    ),

    /// Timetable Tab:
    ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return InfoCard(
          isButtonVisible: false,
          isLectureCard: false,
          cardTitle: days[index],
          cardDescription: "Tap here to show the lectures of today.",
          cardThumbnail: const Icon(Icons.table_chart),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return StudentTimetable(day: days[index]);
            }));
          },
        );
      },
    ),

    /// Instructors Tab:
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instructorCubit,
        ),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
      ],
      child: BlocConsumer<InstructorCubit, InstructorState>(
        listener: (context, state) {},
        builder: (context, studentInstructorState) {
          if (studentInstructorState is InstructorInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          if (studentInstructorState is InstructorLoaded &&
              (studentInstructorState.instructors!.isNotEmpty)) {
            return ListView.builder(
              itemCount: studentInstructorState.instructors!.length,
              itemBuilder: (context, index) {
                return InfoCard(
                  isLectureCard: false,
                  isButtonVisible: false,
                  isTopLeftBorderMaxRadius: false,
                  cardThumbnail: const Icon(Icons.person),
                  cardDescription:
                  'Email: ${studentInstructorState.instructors![index].emailId}\n'
                      'Department: ${studentInstructorState.instructors![index].department}\n',
                  cardTitle:
                      "DR. ${studentInstructorState.instructors![index].firstName} "
                          "${studentInstructorState.instructors![index].firstName}",
                );
              },
            );
          }
          return const Center(
            child: Text('No instructors are assigned yet.'),
          );
        },
      ),
    ),
  ];
}

Future<void> showQRCodePopup(BuildContext context,
    {double? edgeLength, String? qrData}) async {
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
        title: const Text('Scan Your QR Code from your instructor\'s device.'),
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
