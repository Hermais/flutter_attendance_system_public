class Attendance{
  int? lectureId;
  String? studentEmail;

  Attendance({this.lectureId, this.studentEmail});


  Map<String, dynamic> toJson(){
    return {
      'lectureId': lectureId,
      'studentEmail': studentEmail,
    };
  }

}