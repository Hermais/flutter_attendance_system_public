import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/student_cubit.dart';
import 'package:flutter_attendance_system/features/screens/users_pages/3_student_pages/student_dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/lecture_cubit.dart';
import '../../../../core/data/repositories/lecture_repository.dart';
import '../../../../core/data/services/lecture_web_services.dart';
import '../../../widgets/card_widget.dart';
import '../../login_page/login.dart';


class StudentTimetable extends StatelessWidget {

  final String day;

  const StudentTimetable({super.key, required this.day });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lecture of $day'),
        ),

        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => studentCubit!,
            ),
            BlocProvider(
              create: (context) =>
              LectureCubit(
                  lectureRepository:
                  LectureRepository(lectureWebServices: LectureWebServices()))
                ..getLecturesByDay(
                    day: day,
                    department: (studentCubit!.state as StudentLoaded)
                        .students[0]
                        .department!,
                    academicYear: (studentCubit!.state as StudentLoaded)
                        .students[0]
                        .studyYear!
                ),
            ),

          ],
          child: BlocBuilder<LectureCubit, LectureState>(
            builder: (context, lectureState) {
              if (lectureState is LectureInitial) {
                return Center(
                  child: CircularProgressIndicator(color: Theme
                      .of(context)
                      .primaryColor,),
                );
              }
              if (lectureState is LectureLoaded &&
                  (lectureState.lectureList.isNotEmpty)) {
                return ListView.builder(
                    itemCount: lectureState.lectureList.length,
                    itemBuilder: (context, index) {
                      return InfoCard(
                        isLectureCard: true,
                        isButtonVisible: false,
                        isTopLeftBorderMaxRadius: false,
                        cardThumbnail: const Icon(Icons.book),
                        cardDescription:
                        "Lecture of ${day} will be shown here.",
                        cardTitle: "${lectureState.lectureList[0]
                            .courseCode}",
                        lectureStartsAt: lectureState.lectureList[0]
                            .startTime.toString().substring(10, 16),
                        lectureEndsAt: lectureState.lectureList[0]
                            .endTime.toString().substring(10, 16),
                        lecturePlace: lectureState.lectureList[0]
                            .hallLocation.toString(),
                      );
                    });
              }
              return const Center(
                child: Text("No lectures today."),
              );
            },
          ),
        ));
  }
}