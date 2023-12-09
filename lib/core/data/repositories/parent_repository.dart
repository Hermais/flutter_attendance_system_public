
import '../models/parent_model.dart';
import '../services/parent_web_services.dart';

class ParentRepository {
  final  ParentWebServices  parentWebServices;

  ParentRepository({required this. parentWebServices});

  Future<List<Parent>> getParentData() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final  parent =
    await  parentWebServices.getParentData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return  parent
        .map((elementInListFromWebService) =>
        Parent.fromJson(elementInListFromWebService))
        .toList();
  }

}