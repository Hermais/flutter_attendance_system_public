class Student {
  int? id;
  String studentName;
  String identifier;
  String dob;
  int universityID;


  Student.withoutID(this.studentName, this.identifier, this.dob, this.universityID);

  Map<String, dynamic> toJson() {
    return {
      'studentName' : studentName,
      'identifier' :identifier,
      'dob' : dob,
      'universityID' : universityID

    };
  }

}
