class Parent {
  late String firstName;
  late String lastName;
  late String emailId;
  late String nationalId;
  late DateTime dateOfBirth;

  Parent({
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.nationalId,
    required this.dateOfBirth,
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
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }
}
