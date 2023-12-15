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

}