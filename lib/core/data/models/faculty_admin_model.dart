class FacultyAdmin {
  int? adminID;
   String? firstName;
   String? lastName;
   String? emailID;
   int? nationalID;
   String? dateOfBirth;

  FacultyAdmin({
    this.adminID,
     this.firstName,
     this.lastName,
     this.emailID,
     this.nationalID,
     this.dateOfBirth
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