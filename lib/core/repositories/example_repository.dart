import 'package:flutter_attendance_system/core/models/example_model.dart';
import 'package:flutter_attendance_system/core/services/example_web_services.dart';

class ExampleStudentRepository {
  final ExampleStudentWebService exampleStudentWebService;

  ExampleStudentRepository({required this.exampleStudentWebService});

  Future<List<ExampleStudent>> getExampleStudentData() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final exampleStudents =
        await exampleStudentWebService.getExampleStudentData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return exampleStudents
        .map((elementInListFromWebService) =>
            ExampleStudent.fromJson(elementInListFromWebService))
        .toList();
  }

}

