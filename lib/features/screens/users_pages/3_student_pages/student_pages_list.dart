import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_manager_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/lecture_repository.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/1_faculty_admin_pages/faculty_admin_timetable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';


import 'package:intl/intl.dart';
import '../../../../core/data/services/lecture_web_services.dart';
import '../../../../shared/constants_and_statics/shared_vars.dart';
import '../../../widgets/card_widget.dart';

List<Widget> provideWidgetOptions(BuildContext mainContext) {
  return <Widget>[
    /// Lectures Tab:
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LectureCubit(
              lectureRepository:
                  LectureRepository(lectureWebServices: LectureWebServices()))..loadDefault(),
        ),
        BlocProvider(
          create: (context) => LectureManagerCubit(),
        ),
      ],
      child: BlocListener<LectureManagerCubit, LectureManagerState>(
        listener: (context, state) {
          if (state is LectureInSession) {
            showQRCodePopup(context);
          } else if (state is LectureManagerFailed){
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
          builder: (context, state) {
            if (state is LectureInitial) {

              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LectureLoaded || state is LectureDefault)
              {
                print(DateTime.now().timeZoneName);
                return ListView.builder(
                    itemCount:
                    state
                        .lectureList
                        .length,
                    itemBuilder: (context, index) {
                      return InfoCard(
                        cardThumbnail: const Icon(Icons.book),
                        cardTitle: state.lectureList[index].courseCourseCode,
                        lectureStartsAt: DateFormat("hh:mm a").format(state.lectureList[index].startTime),
                        lectureEndsAt: DateFormat("hh:mm a" ).format(state.lectureList[index].endTime),
                        lecturePlace: state.lectureList[index].hallLocation.toString(),
                        buttonText: "Start",
                        onButtonTap: () {
                          BlocProvider.of<LectureManagerCubit>(context)
                              .checkLectureToStart(
                              state
                                  .lectureList[index]);
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

    /// Instructors Tab:
    ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InfoCard(
          isLectureCard: false,
          isButtonVisible: false,
          isTopLeftBorderMaxRadius: false,
          cardThumbnail: const Icon(Icons.person),
          cardDescription: "The whereabouts of the instructor will be here.",
          cardTitle: "Instructor ${index + 1}",
        );
      },
    ),

    /// Timetable Tab:
    ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return InfoCard(
          isButtonVisible: false,
          isLectureCard: false,
          cardTitle: days[index],
          cardDescription: "No lectures today.",
          cardThumbnail: const Icon(Icons.table_chart),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              /// An arbitrary academic year and department is passed to
              /// the constructor. In actual implementation, the academic year
              /// and department will be provided.
              return FacultyAdminTimetables(
                academicYear: academicYears[0],
              ).getLecturesByDay(days[index], department: departments[0]);
            }));
          },
        );
      },
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
