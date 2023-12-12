import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_cubit.dart';
import 'package:flutter_attendance_system/features/widgets/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/repositories/lecture_repository.dart';
import '../../../../core/data/services/lecture_web_services.dart';
import '../../../../shared/constants_and_statics/shared_vars.dart';


/// This class manages all of the timetables of the faculty admin.
/// It is also used by the student to show their timetable, with the method
/// getLecturesByDay().
class FacultyAdminTimetables extends StatelessWidget {
  // routeName variable decides which page to show of academic years.
  final String academicYear;
  final LectureRepository lectureRepository = LectureRepository(
      lectureWebServices: LectureWebServices());

  FacultyAdminTimetables({super.key, required this.academicYear});

   String? globalDepartment;

  @override
  Widget build(BuildContext context) {


    /// Both showDepartments() and showDaysToSelect() will be wrapped by a
    /// BlocProvider to provide the lectures respectively.
    if (academicYear == prepYear) {
      // for a routeName of preparatoryTimetable, show the days to select day timetable.

      return BlocProvider(
        create: (context) => LectureCubit(lectureRepository: lectureRepository),
        child: showDaysToSelect(),
      );
    }
    // otherwise, show the departments to select department timetable.
    return BlocProvider(
      create: (context) => LectureCubit(lectureRepository: lectureRepository),
      child: showDepartments(),
    );
  }

  Widget showDepartments() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Department'),
      ),
      body: ListView.builder(
        itemCount: departments.length,
        itemBuilder: (context, index) {
          return InfoCard.blank(
            cardTitle: departments[index],
            cardDescription:
            'Tap here to go to select days for ${departments[index]}',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                globalDepartment = departments[index];
                return showDaysToSelect();
              }));
            },
          );
        },
      ),
    );
  }

  Widget showDaysToSelect() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Day'),
      ),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) {
          return InfoCard.blank(
            cardTitle: days[index],
            cardDescription:
            'Tap here to go to select lectures for ${days[index]}',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => getLecturesByDay(days[index])));
            },
          );
        },
      ),
    );
  }

  /// The actual method that calls the api to get the lectures of the day.
  Widget getLecturesByDay(day, {String? academicYear, String? department}) {
    // TODO: implement _getPrepLectureByDay by calling the api.
    // TODO: TIP: Replace body's current widget with the actual widget.

    // AcademicYear will be mapped to 0, 1, 2, 3 and 4.
    // this is done from const map yearMap in shared_vars.dart.
    academicYear ?? academicYear;

    // department will be sent as a string as is.
    globalDepartment ?? 'Preparatory';
    department ?? globalDepartment;

    /// if department is null, show for preparatory.
    return Scaffold(
      appBar: AppBar(
        title: Text(day),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InfoCard(
              isButtonVisible: false,
              cardTitle: 'Lecture ${index + 1}',
              cardDescription:
              'Lecture Description is probably provided.',
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => _getLecturesByDay(days[index])));
              },
            );
          }),
    );
  }
}
