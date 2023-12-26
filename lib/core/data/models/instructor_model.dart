class Instructor {
  int instructorId;
  String lastName;
  String emailId;
  String nationalId;
  DateTime dateOfBirth;
  int adminId;

  Instructor({
    required this.instructorId,
    required this.lastName,
    required this.emailId,
    required this.nationalId,
    required this.dateOfBirth,
    required this.adminId,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      instructorId: json['instructorId'],
      lastName: json['lastName'],
      emailId: json['emailId'],
      nationalId: json['nationalId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      adminId: json['adminId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instructorId': instructorId,
      'lastName': lastName,
      'emailId': emailId,
      'nationalId': nationalId,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'adminId': adminId,
    };
  }
}