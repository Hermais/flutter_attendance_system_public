import 'package:dio/dio.dart';

import '../../../shared/constants_and_statics/shared_vars.dart';


class InstructorWebServices {
  /// use late keyword to tell dart that we will initialize this variable later.
  late Dio dio;

  InstructorWebServices() {
    /// BaseOptions is a class that contains the base url, timeout, etc. This is a
    /// configuration class for Dio.
    BaseOptions options = BaseOptions(
      baseUrl: exampleBaseURL,
      connectTimeout: maxDuration,
      receiveTimeout: maxDuration,
      receiveDataWhenStatusError: true,
    );

    /// When we instantiate Dio, we pass in the options we created above.
    dio = Dio(options);

  }

  /// list type must be dynamic because it can be a list of strings or a list of maps.
  Future<List<dynamic>> getInstructorData() async {
    try {
      /// here we type in the endpoint of the api, without the base url.
      Response response = await dio.get('/getAllInstructor');
      /// in flutter http response.body, here response.data
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<void> postInstructorData(Map<String, dynamic> postData) async {
    try {
      await dio.post('/postInstructor', data: postData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}