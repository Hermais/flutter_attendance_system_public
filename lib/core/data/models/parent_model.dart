class Parent {
   String? firstName;
   String? lastName;
   String? emailId;
   String? nationalId;
   DateTime? dateOfBirth;

  Parent({
     this.firstName,
     this.lastName,
     this.emailId,
     this.nationalId,
     this.dateOfBirth,

  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailId: json['emailId'],
      nationalId: json['nationalId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'emailId': emailId,
      'nationalId': nationalId,
      'dateOfBirth': dateOfBirth!.toIso8601String().substring(0, 10),
    };
  }
}
