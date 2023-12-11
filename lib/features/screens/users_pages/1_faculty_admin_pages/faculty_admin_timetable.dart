import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/features/widgets/card_widget.dart';

import '../../../../shared/constants_and_statics/shared_vars.dart';

class FacultyAdminTimetables extends StatefulWidget {
  // routeName variable decides which page to show of academic years.
  final String routeName;

  const FacultyAdminTimetables({super.key, required this.routeName});

  @override
  State<FacultyAdminTimetables> createState() => _FacultyAdminTimetablesState();
}

class _FacultyAdminTimetablesState extends State<FacultyAdminTimetables> {
  String? globalDepartment;

  @override
  Widget build(BuildContext context) {
    if (widget.routeName == prepYear) {
      // for a routeName of preparatoryTimetable, show the days to select day timetable.
      return _showDaysToSelect();
    }
    // otherwise, show the departments to select department timetable.
    return _showDepartments();
  }

  Widget _showDaysToSelect() {
    List<String> days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Saturday'
    ];

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
                  builder: (context) => _getLecturesByDay(days[index])));
            },
          );
        },
      ),
    );
  }

  /// The actual method that calls the api to get the lectures of the day.
  Widget _getLecturesByDay(day, {String? academicYear, String? department}) {
    // TODO: implement _getPrepLectureByDay by calling the api.
    // TODO: TIP: Replace body's current widget with the actual widget.

    // AcademicYear will be mapped to 0, 1, 2, 3 and 4.
    // this is done from const map yearMap in shared_vars.dart.
    academicYear ?? widget.routeName;

    // department will be sent as a string as is.
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

  Widget _showDepartments() {
    List<String> departments = [
      'Physics and Engineering Mathematics',
      'Mechanical Design and Manufacturing',
      'Industrial Engineering',
      'Materials Engineering',
      'Computer and Systems Engineering',
      'Environmental Engineering',
      'Electronics and Electrical Communications Engineering',
      'Power Engineering and Electrical Machines',
      'Mechanical Power Engineering',
      'Construction and Facilities Engineering',
      'Water Engineering and Water Facilities',
      'Architecture',
      'Structural Engineering'
    ];

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
                return _showDaysToSelect();
              }));
            },
          );
        },
      ),
    );
  }
}
