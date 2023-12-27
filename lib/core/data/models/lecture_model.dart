import 'package:intl/intl.dart';

class Lecture {
  int? lectureId;
  int? adminId;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? firstDate;
  int? hallLocation;
  String? courseCode;
  String? courseName;

  Lecture({
     this.lectureId,
     this.startTime,
     this.endTime,
     this.firstDate,
     this.hallLocation,
      this.adminId,
      this.courseCode,
      this.courseName,


  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    String? startTimeString = json['startTime'];
    String? endTimeString = json['endTime'];
    String? firstDateString = json['firstDate'];

    DateTime? startTime;
    DateTime? endTime;
    DateTime? firstDate;

    if (startTimeString != null) {
      startTime = DateFormat('HH:mm:ss').parse(startTimeString);
    }

    if (endTimeString != null) {
      endTime = DateFormat('HH:mm:ss').parse(endTimeString);
    }

    if (firstDateString != null) {
      firstDate = DateFormat('yyyy-MM-dd').parse(firstDateString);
    }
    return Lecture(
      lectureId: json['lectureId'],
      startTime: startTime,
      endTime: endTime,
      firstDate: firstDate,
      hallLocation: json['hallLocation'],
      adminId: json['adminId'],
      courseCode: json['courseCode'],
      courseName: json['courseName'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime!.toString().split(" ")[1].substring(0, 8),
      'endTime': endTime!.toString().split(" ")[1].substring(0, 8),
      'firstDate': firstDate!.toString().substring(0, 10),
      'hallLocation': hallLocation,
      'adminId': 1,
      'courseCode': courseCode,


    };
  }
}
