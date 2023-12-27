class AuthPost{
  int? lectureId;
  String? studentEmail;

  AuthPost({this.lectureId, this.studentEmail});


  Map<String, dynamic> toJson(){
    return {
      'lectureId': lectureId,
      'studentEmail': studentEmail,
    };
  }

}