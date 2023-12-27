class AuthPost{
  final String emailId;
  final String nationalId;

  AuthPost({required this.emailId, required this.nationalId});


  Map<String, dynamic> toJson(){
    return {
      'emailId': emailId,
      'nationalId': nationalId,
    };
  }
}