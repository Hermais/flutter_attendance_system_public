import '../models/course_model.dart';
import '../services/course_web_services.dart';

class CourseRepository {
  final CourseWebServices courseWebServices;

  CourseRepository({required this.courseWebServices});



  Future<List<Course>> getCourse() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final courses = await courseWebServices.getCourseData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return courses
        .map((elementInListFromWebService) =>
            Course.fromJson(elementInListFromWebService))
        .toList();
  }

  Future<List<Course>> getCourseByDepartment(String department) async {

    final courses = await courseWebServices.getCourseDataByDepartment(department);

    return courses
        .map((elementInListFromWebService) =>
        Course.fromJson(elementInListFromWebService))
        .toList();
  }

  Future<List<Course>> getCourseByInstructorId(int instructorId) async {

    final courses = await courseWebServices.getCourseDataByInstructorId(instructorId);

    return courses
        .map((elementInListFromWebService) =>
        Course.fromJson(elementInListFromWebService))
        .toList();
  }

}
