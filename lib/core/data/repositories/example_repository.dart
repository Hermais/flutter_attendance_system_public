import '../models/example_model.dart';
import '../services/example_web_services.dart';

class UserRepository {
  final UserWebService userWebService;

  UserRepository({required this.userWebService});

  Future<List<User>> getUsers() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final futureUserList = await userWebService.getUserData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return futureUserList
        .map((elementInListFromWebService) =>
            User.fromJson(elementInListFromWebService))
        .toList();
  }
}
