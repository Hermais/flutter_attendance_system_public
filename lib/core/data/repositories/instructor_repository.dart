
import '../models/instructor_model.dart';
import '../models/student_model.dart';
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

      await instructorWebServices.postInstructorData(instructor.toJson());

  }
  Future<List<Instructor>> getInstructorDataById(int id) async {
    final data = await instructorWebServices.getInstructorDataById(id);

    print(data);
    // Ensure that data is not null before calling fromJson
    if (data != null) {
      return data
          .map((elementInListFromWebService) =>
          Instructor.fromJson(elementInListFromWebService))
          .toList();
    } else {
      // Handle the case where the response data is null
      throw Exception('Failed to get instructor data by ID');
    }
  }

  Future<List<Instructor>> getInstructorByStudentId(int id) async {
    final data = await instructorWebServices.getInstructorByStudentId(id);

    print(data);
    // Ensure that data is not null before calling fromJson
    if (data != null) {
      return data
          .map((elementInListFromWebService) =>
          Instructor.fromJson(elementInListFromWebService))
          .toList();
    } else {
      // Handle the case where the response data is null
      throw Exception('Failed to get instructor data by ID');
    }
  }


}