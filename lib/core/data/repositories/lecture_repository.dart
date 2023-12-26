
import '../models/lecture_model.dart';
import '../services/lecture_web_services.dart';

class LectureRepository {
  final LectureWebServices lectureWebServices;

  LectureRepository ({required this.lectureWebServices});

  Future<List<Lecture>> getLecture() async {
    /// This is an implicit list of maps, to store our data from the web
    /// service (Example Students).
    final lecture =
    await lectureWebServices.getLectureData();

    /// map is a special method inside the List class that allows us to transform
    /// each element in the list. By transforming we mean that we can change the
    /// type of each element in the list by the lambada function.
    return lecture
        .map((elementInListFromWebService) =>
        Lecture.fromJson(elementInListFromWebService))
        .toList();
  }

  Future<void> postLecture(Lecture lecture) async {
    await lectureWebServices.postLectureData(lecture.toJson());
  }

}

