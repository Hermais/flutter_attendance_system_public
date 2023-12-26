class Course {
  String? courseCode;
  String? courseName;
  String? department;
  int? studyYear;

  Course({
     this.courseCode,
     this.courseName,
     this.department,
     this.studyYear,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseCode: json['courseCode'],
      courseName: json['courseName'],
      department: json['department'],
      studyYear: json['studyYear'],
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'courseCode': courseCode,
      'courseName': courseName,
      'department': department,
      'studyYear': studyYear,
    };
  }
}
