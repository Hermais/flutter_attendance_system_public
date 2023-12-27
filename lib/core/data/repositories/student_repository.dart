import '../models/student_model.dart';
import '../services/student_web_services.dart';

class StudentRepository {
  final StudentWebServices studentWebServices;

  StudentRepository({required this.studentWebServices});

  Future<List<Student>> getStudentData() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final students =
    await studentWebServices.getStudentData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return students
        .map((elementInListFromWebService) =>
        Student.fromJson(elementInListFromWebService))
        .toList();
  }
  Future<void> postStudentData(Student student) async {

      await studentWebServices.postStudentData(student.toJson());

  }
  Future<List<Student>> getInstructorDataById(int id) async {
    final data = await studentWebServices.getStudentDataById(id);

    print(data);
    // Ensure that data is not null before calling fromJson
    if (data != null) {
      return data
          .map((elementInListFromWebService) =>
          Student.fromJson(elementInListFromWebService))
          .toList();
    } else {
      // Handle the case where the response data is null
      throw Exception('Failed to get instructor data by ID');
    }
  }

  Future<List<Student>> getStudentInstructorById(int id) async {
    final data = await studentWebServices.getStudentInstructorById(id);

    print(data);
    // Ensure that data is not null before calling fromJson
    if (data != null) {
      return data
          .map((elementInListFromWebService) =>
          Student.fromJson(elementInListFromWebService))
          .toList();
    } else {
      // Handle the case where the response data is null
      throw Exception('Failed to get instructor data by ID');
    }
  }
}