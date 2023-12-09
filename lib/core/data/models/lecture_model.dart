class Lecture {
  int lectureID;
  DateTime startTime;
  DateTime endTime;
  DateTime firstDate;
  int hallLocation;
  int doctorDoctorId;
  String courseCourseCode;
  int adminAdminId;
  int termTermId;

  Lecture({
    required this.lectureID,
    required this.startTime,
    required this.endTime,
    required this.firstDate,
    required this.hallLocation,
    required this.doctorDoctorId,
    required this.courseCourseCode,
    required this.adminAdminId,
    required this.termTermId,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      lectureID: json['LectureID'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      firstDate: DateTime.parse(json['firstDate']),
      hallLocation: json['hallLocation'],
      doctorDoctorId: json['DOCTOR_DoctorId'],
      courseCourseCode: json['COURSE_courseCode'],
      adminAdminId: json['ADMIN_AdminId'],
      termTermId: json['TERM_termId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'LectureID': lectureID,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'firstDate': firstDate.toIso8601String(),
      'hallLocation': hallLocation,
      'DOCTOR_DoctorId': doctorDoctorId,
      'COURSE_courseCode': courseCourseCode,
      'ADMIN_AdminId': adminAdminId,
      'TERM_termId': termTermId,
    };
  }
}
