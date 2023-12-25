
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
  Future<void> postUser(Instructor instructor) async {
    try {
      final Map<String, dynamic> instructorData = instructor.toJson();
      await instructorWebServices.postData(instructorData);
    } catch (e) {
      throw Exception('Failed to post instructor: $e');
    }
  }

}