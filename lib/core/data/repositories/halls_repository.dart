import '../services/halls_web_services.dart';

class HallRepository{

final HallWebServices hallWebServices;

HallRepository({required this.hallWebServices});


Future<List<String>> getHalls() async {
  final halls = await hallWebServices.getAllHalls();
  return halls.map((elementInListFromWebService) => elementInListFromWebService.toString()).toList();

}

}