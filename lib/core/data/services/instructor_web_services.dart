import 'package:dio/dio.dart';
import 'package:flutter_attendance_system/core/data/models/attendance_post_model.dart';
import 'package:flutter_attendance_system/main.dart';

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

    dio = Dio(options);

  }

  Future<List<dynamic>> getInstructorData() async {
      Response response = await dio.get('/admin/instructor');
      return response.data;
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
      await dio.post('/admin/instructor', data: instructor);
  }
  Future<String?> postAttendance(Attendance attendance) async {
    try {
      // Use queryParameters to include query parameters
      Response<String> response = await dio.post(
        '/student/mark-attendance',
        queryParameters: {
          'lectureId': attendance.lectureId,
          'studentEmail': attendance.studentEmail,
        },
      );

      customPrint(response.data!);
      return response.data!;
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