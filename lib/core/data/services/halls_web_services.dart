import 'package:dio/dio.dart';

import '../../../shared/constants_and_statics/shared_vars.dart';

class HallWebServices
{
  late Dio dio;

  HallWebServices() {

    BaseOptions options = BaseOptions(
      baseUrl: exampleBaseURL,
      connectTimeout: maxDuration,
      receiveTimeout: maxDuration,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);

  }

  Future<List<dynamic>> getAllHalls() async {
      Response response = await dio.get('/admin/availableHalls');
      return response.data;
  }



}