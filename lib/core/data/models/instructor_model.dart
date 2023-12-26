class Instructor {
  int instructorId;
  String firstName;
  String lastName;
  String emailId;
  String nationalId;
  DateTime dateOfBirth;
  String department;
  int adminId;
  List<String>? courseCode;


  Instructor({
    required this.instructorId,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.nationalId,
    required this.dateOfBirth,
    required this.adminId,
    required this.department,
    this.courseCode
  });


  // We won't need the courseCode in the get request
  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      instructorId: json['instructorId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailId: json['emailId'],
      nationalId: json['nationalId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      adminId: json['adminId'],
      department: json['department']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instructorId': instructorId,
      'firstName':firstName,
      'lastName': lastName,
      'emailId': emailId,
      'nationalId': nationalId,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'adminId': 1,
      'department':department,
      'courseCode':courseCode ?? []
    };
  }
}