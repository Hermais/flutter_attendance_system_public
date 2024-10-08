import 'package:dio/dio.dart';

import '../../../shared/constants_and_statics/shared_vars.dart';


class LectureWebServices {
  /// use late keyword to tell dart that we will initialize this variable later.
  late Dio dio;

  LectureWebServices() {
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
  Future<List<dynamic>> getLectureData() async {
    try {
      /// here we type in the endpoint of the api, without the base url.
      Response response = await dio.get('/getLecture');
      /// in flutter http response.body, here response.data
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<dynamic>> getLectureDataByDay({required String day, required String department, required int academicYear}) async {
    try {
      Response response = await dio.get('/admin/$academicYear/$department/$day');
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<void> postLectureData(Map<String, dynamic> lecture) async {

      await dio.post('/admin/lecture', data: lecture);

  }

  Future<List<dynamic>> getLectureTimeTableByDay(int id,String dayOfWeek) async {
    try {
      Response response = await dio.get('/student/$id/lectures/$dayOfWeek');
      print(response.data);
      // convert a map to a list of map
      List<dynamic> list = [response.data];
      print(list);
      return response.data;
    } catch (e) {
      print(e);
      return[];
    }
    }

    Future<List<dynamic>> getLectureOfInstructorById(int id) async {
    try {
      Response response = await dio.get('/instructor/lectures/$id');
      print(response.data);

      return response.data;
    } catch (e) {
      print(e);
      return[];
    }


}
}