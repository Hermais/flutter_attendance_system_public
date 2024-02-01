import 'package:flutter_attendance_system/core/data/services/auth_web_services.dart';

import '../models/auth_post_model.dart';

class AuthRepository{
  final AuthWebServices authWebServices;

  AuthRepository({required this.authWebServices});


  Future<Map<String, dynamic>> postAuth(AuthPost authPost) async {
    final authResponse =
    authWebServices.postAuthData(authPost.toJson());


    return authResponse;
  }

}