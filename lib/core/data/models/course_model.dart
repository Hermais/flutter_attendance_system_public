class Course {
  String courseCode;
  String courseName;
  String department;
  int studyYear;
  int adminAdminId;

  Course({
    required this.courseCode,
    required this.courseName,
    required this.department,
    required this.studyYear,
    required this.adminAdminId
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseCode: json['courseCode'],
      courseName: json['courseName'],
      department: json['department'],
      studyYear: json['studyYear'],
      adminAdminId: json['ADMIN_AdminID'],
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'courseCode': courseCode,
      'courseName': courseName,
      'department': department,
      'studyYear': studyYear,
      'ADMIN_AdminID': adminAdminId,
    };
  }
}
