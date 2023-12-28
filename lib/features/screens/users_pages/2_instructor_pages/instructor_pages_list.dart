import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/course_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_cubit.dart';
import 'package:flutter_attendance_system/core/data/repositories/lecture_repository.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/2_instructor_pages/student_attendance_for_instructor.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/cubits/auth_cubit.dart';
import '../../../../core/cubits/internet_cubit.dart';
import '../../../../core/cubits/lecture_manager_cubit.dart';
import '../../../../core/data/repositories/course_repository.dart';
import '../../../../core/data/services/course_web_services.dart';
import '../../../../core/data/services/lecture_web_services.dart';
import '../../../../main.dart';
import '../../../widgets/card_widget.dart';
import 'instructor_students.dart';

CourseCubit courseCubit = CourseCubit(
    courseRepository: CourseRepository(courseWebServices: CourseWebServices()))
  ..loadCourseByInstructorId((authCubit.state as AuthSuccess).authGet.id);



List<Widget> provideWidgetOptions(BuildContext context, LectureManagerCubit instructorLectureManagerCubit) {
  return <Widget>[

    /// Lectures Tab:
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          LectureCubit(
              lectureRepository:
              LectureRepository(lectureWebServices: LectureWebServices()))
            ..loadDefault(),
        ),
        BlocProvider(
          create: (context) => instructorLectureManagerCubit,
        ),
      ],
      child: BlocListener<LectureManagerCubit, LectureManagerState>(
        listener: (context, lectureManagerState) {
          if (lectureManagerState is LectureManagerInSession) {
            showLectureStartConfirmationPopup(context);
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
            print(lectureState);
            if (lectureState is LectureInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (lectureState is LectureLoaded ||
                lectureState is LectureDefault) {
              print(DateTime
                  .now()
                  .timeZoneName);
              return ListView.builder(
                  itemCount:
                  lectureState
                      .lectureList
                      .length,
                  itemBuilder: (context, index) {
                    return InfoCard(
                      cardThumbnail: const Icon(Icons.book),

                      cardTitle: lectureState.lectureList[index]
                          .courseName,
                      descriptionMaxLines: 4,
                      lectureStartsAt: DateFormat("hh:mm a").format(
                          lectureState.lectureList[index].startTime!),
                      lectureEndsAt: DateFormat("hh:mm a").format(
                          lectureState.lectureList[index].endTime!),
                      lecturePlace: lectureState.lectureList[index].hallLocation
                          .toString(),
                      buttonText: "Start",
                      cardDescription: "Course Code: ${lectureState.lectureList[index].courseCode!}\n",
                      onButtonTap: () {
                        BlocProvider.of<LectureManagerCubit>(context)
                            .checkLectureToStart(
                            lectureState
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

    /// Students Tab:
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          courseCubit,),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
      ],
      child: BlocConsumer<CourseCubit,CourseState>(
        listener: (context, courseState) {

        },
        builder: (context, courseState) {
          if (courseState is CourseInitial) {
            return Center(
              child: CircularProgressIndicator(color: Theme
                  .of(context)
                  .primaryColor,),
            );
          }
          if (courseState is CourseLoaded ) {
            return ListView.builder(
              itemCount: courseState.courses.length,
              itemBuilder: (context, index) {
                return InfoCard(
                    isLectureCard: false,
                    isButtonVisible: false,
                    isTopLeftBorderMaxRadius: false,
                    cardThumbnail: const Icon(Icons.person),
                    descriptionMaxLines: 4,
                    cardDescription:
                    "Course Code: ${courseState.courses[index].courseCode!}\n"
                        "Department: ${courseState.courses[index].department!}\n"
                        "Academic Year: ${academicYears[courseState.courses[index].studyYear!]}",
                    cardTitle: courseState.courses[index].courseName!,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return InstructorStudents(
                              courseCode: courseState.courses[index].courseCode!,
                            courseName: courseState.courses[index].courseName!,);
                          }));
                    }
                );
              },
            );
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        },
      ),
    ),



    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          courseCubit,),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
      ],
      child: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {

        },
        builder: (context, courseState) {
          if (courseState is CourseInitial) {
            return Center(
              child: CircularProgressIndicator(color: Theme
                  .of(context)
                  .primaryColor,),
            );
          }
          if (courseState is CourseLoaded) {
            return ListView.builder(
              itemCount: courseState.courses.length,
              itemBuilder: (context, index) {
                return InfoCard(
                    isLectureCard: false,
                    isButtonVisible: false,
                    isTopLeftBorderMaxRadius: false,
                    cardThumbnail: const Icon(Icons.person),
                    cardDescription:
                    "Course Code: ${courseState.courses[index].courseCode!}\n"
                        "Department: ${courseState.courses[index].department!}\n"
                        "Academic Year: ${academicYears[courseState.courses[index].studyYear!]}",
                    cardTitle: courseState.courses[index].courseName!,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ShowWeeks(
                          courseCode: courseState.courses[index].courseCode!,
                        );
                      }));
                    }
                );
              },
            );
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        },
      ),
    ),

  ];
}



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
                    backgroundColor: Theme
                        .of(context)
                        .primaryColor,
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

