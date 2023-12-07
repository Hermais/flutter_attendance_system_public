class ExampleStudent {

  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String phoneNumber;
  late String profilePicture;
  late String studentId;
  late String department;
  late String level;
  late String section;
  late String group;
  late String term;
  late String academicYear;
  late String birthDate;


  /// This named constructor is used to convert the json response from the api to a dart object.
  ExampleStudent.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    profilePicture = json['profilePicture'];
    studentId = json['studentId'];
    department = json['department'];
    level = json['level'];
    section = json['section'];
    group = json['group'];
    term = json['term'];
    academicYear = json['academicYear'];
    birthDate = json['birthDate'];
  }

}