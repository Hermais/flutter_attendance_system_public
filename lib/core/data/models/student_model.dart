class Student {
  int studentId;
  String firstName;
  String lastName;
  String emailId;
  DateTime dateOfBirth;
  String nationality;
  String department;
  int studyYear;
  int parentParentId;
  int adminAdminId;

  Student({
    required this.studentId,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.dateOfBirth,
    required this.nationality,
    required this.department,
    required this.studyYear,
    required this.parentParentId,
    required this.adminAdminId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentId: json['StudentID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailId: json['emailID'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      nationality: json['nationality'],
      department: json['department'],
      studyYear: json['studyYear'],
      parentParentId: json['PARENT_ParentID'],
      adminAdminId: json['ADMIN_AdminID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'StudentID': studentId,
      'firstName': firstName,
      'lastName': lastName,
      'emailID': emailId,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'nationality': nationality,
      'department': department,
      'studyYear': studyYear,
      'PARENT_ParentID': parentParentId,
      'ADMIN_AdminID': adminAdminId,
    };
  }
}