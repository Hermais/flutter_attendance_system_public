import 'package:flutter_attendance_system/core/data/models/parent_model.dart';

class Student {
  String firstName;
  String lastName;
  String emailId;
  DateTime dateOfBirth;
  String nationalID;
  String department;
  int studyYear;
  int adminAdminId;
  Parent parent;


  Student({
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.dateOfBirth,
    required this.nationalID,
    required this.department,
    required this.studyYear,
    required this.adminAdminId,
    required this.parent,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailId: json['emailID'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      nationalID: json['nationality'],
      department: json['department'],
      studyYear: json['studyYear'],
      adminAdminId: json['ADMIN_AdminID'],
      parent: Parent.fromJson(json['parent']),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'emailID': emailId,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'nationality': nationalID,
      'department': department,
      'studyYear': studyYear,
      'ADMIN_AdminID': adminAdminId,
      'parent': parent.toJson(),

    };
  }
}