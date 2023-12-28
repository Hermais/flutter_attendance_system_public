class Instructor {
  int? instructorId;
  String? firstName;
  String? lastName;
  String? emailId;
  String? nationalId;
  DateTime? dateOfBirth;
  String? department;
  int? adminId;
  List<String>? courseCode;


  Instructor({
    this.instructorId,
     this.firstName,
     this.lastName,
     this.emailId,
     this.nationalId,
     this.dateOfBirth,
     this.adminId,
     this.department,
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
      department: json['department']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adminId': 1,
      'department':department,
      'firstName':firstName,
      'lastName': lastName,
      'emailId': emailId,
      'nationalId': nationalId,
      'dateOfBirth': dateOfBirth!.toIso8601String().substring(0,10),
      'courseCode': courseCode ?? []
    };
  }
}