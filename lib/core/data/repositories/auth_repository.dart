import 'package:flutter_attendance_system/core/data/services/auth_web_services.dart';

import '../models/auth_post_model.dart';

class AuthRepository{
  final AuthWebServices authWebServices;

  AuthRepository({required this.authWebServices});


  Future<Map<String, dynamic>> postAuth(AuthPost authPost) async {
    final authResponse =
    authWebServices.postAuthData(authPost.toJson());

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return authResponse;
  }

}