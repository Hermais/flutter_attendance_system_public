import 'package:dio/dio.dart';

import '../../../shared/constants_and_statics/shared_vars.dart';

class AuthWebServices{
  late Dio dio;

  AuthWebServices() {
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

  Future<Map<String, dynamic>> postAuthData(Map<String, dynamic> auth) async {
      try{
        Response response = await dio.post('/authenticate', data: auth);
        print(response.data);
        return response.data;
      }catch(e){
        throw Exception('Failed to post auth data');
      }


  }

}