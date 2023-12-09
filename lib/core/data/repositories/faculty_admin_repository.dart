
import '../models/faculty_admin_model.dart';
import '../services/faculty_admin_web_services.dart';

class FacultyAdminRepository {
  final  FacultyAdminWebServices facultyAdminWebServices;

  FacultyAdminRepository({required this. facultyAdminWebServices});

  Future<List<FacultyAdmin>> getFacultyAdminData() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final  facultyAdmin =
    await  facultyAdminWebServices.getFacultyAdminData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return  facultyAdmin
        .map((elementInListFromWebService) =>
        FacultyAdmin.fromJson(elementInListFromWebService))
        .toList();
  }

}