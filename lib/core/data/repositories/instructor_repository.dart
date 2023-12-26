
import '../models/instructor_model.dart';
import '../services/instructor_web_services.dart';

class InstructorRepository {
  final  InstructorWebServices  instructorWebServices;

  InstructorRepository({required this. instructorWebServices});

  Future<List<Instructor>> getInstructorData() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final  instructors =
    await  instructorWebServices.getInstructorData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return  instructors
        .map((elementInListFromWebService) =>
        Instructor.fromJson(elementInListFromWebService))
        .toList();
  }

  Future<List<Instructor>> getInstructorDataByDepartment(String department) async {

    final  instructors =
    await  instructorWebServices.getInstructorDataByDepartment(department);


    return  instructors
        .map((elementInListFromWebService) =>
        Instructor.fromJson(elementInListFromWebService))
        .toList();
  }
  Future<void> postInstructorData(Instructor instructor) async {
    try {
      await instructorWebServices.postInstructorData(instructor.toJson());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}