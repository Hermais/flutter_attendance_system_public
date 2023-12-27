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
      Response response = await dio.get('/admin/instructor');
      /// in flutter http response.body, here response.data
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<dynamic>> getInstructorDataByDepartment(String department) async {
    try {
      Response response = await dio.get('/admin/instructorByDepartment/$department');
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<List<dynamic>> getInstructorDataById(int id) async {
    try {
      Response response = await dio.get('/admin/instructorById/$id');
      print(response.data);
      // convert a map to a list of map
      List<dynamic> list = [response.data];
      print(list);
      return Future.value(list);
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<void> postInstructorData(Map<String, dynamic> instructor) async {
    try {
      await dio.post('/admin/instructor', data: instructor);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<dynamic>> getInstructorByStudentId(int id) async {
    try {
      Response response = await dio.get('/student/instructorByStudent/$id');
      print(response.data);
      // convert a map to a list of map
      List<dynamic> list = [response.data];
      print(list);
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}