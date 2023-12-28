import 'package:flutter_attendance_system/core/data/models/parent_model.dart';

class Student {
  String? firstName;
  String? lastName;
  String? emailId;
  DateTime? dateOfBirth;
  String? nationalId;
  String? department;
  int? studyYear;
  int? adminId;
  Parent? parentDto;

  Student({
    this.firstName,
    this.lastName,
    this.emailId,
    this.dateOfBirth,
    this.nationalId,
    this.department,
    this.studyYear,
    this.adminId,
    this.parentDto,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailId: json['emailId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      nationalId: json['nationalId'],
      department: json['department'],
      studyYear: json['studyYear'],
      adminId: json['adminId'],
      parentDto: json['parentDto'] == null ? null:Parent.fromJson(json['parentDto']),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth!.toIso8601String().substring(0, 10),
      'nationalId': nationalId,
      'department': department,
      'studyYear': studyYear,
      'adminId': adminId,
      'emailId': emailId,
      'parentDto': parentDto!.toJson(),

    };
  }
}