class FacultyAdmin {
  late int adminID;
  late String firstName;
  late String lastName;
  late String emailID;
  late int nationalID;
  late DateTime dateOfBirth;

  FacultyAdmin({
    required this.adminID,
    required this.firstName,
    required this.lastName,
    required this.emailID,
    required this.nationalID,
    required this.dateOfBirth
  });

  factory FacultyAdmin.fromJson(Map<String, dynamic> json) {
    return FacultyAdmin(
      adminID: json['adminID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailID: json['emailID'],
      nationalID: json['nationalID'],
        dateOfBirth: json['dateOfBirth']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adminId': adminID,
      'firstName': firstName,
      'lastName': lastName,
      'emailID': emailID,
      'nationalID': nationalID,
      'dateOfBirth' :dateOfBirth
    };
  }
}