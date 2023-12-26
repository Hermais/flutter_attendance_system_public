class Instructor {
  int adminId;
  String department;
  String firstName;
  String lastName;
  String emailId;
  String nationalId;
  String dateOfBirth;
  int instructorId;

  Instructor({
    required this.adminId,
    required this.department,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.nationalId,
    required this.dateOfBirth,
    required this.instructorId,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      adminId: json['adminId'] as int,
      department: json['department'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      emailId: json['emailId'] as String,
      nationalId: json['nationalId'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      instructorId: json['instructorId'] as int,
    );
  }
}
