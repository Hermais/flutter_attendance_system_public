part of 'lecture_cubit.dart';

@immutable
abstract class LectureState {
  final List<Lecture> lectureList = [];

}

class LectureInitial extends LectureState {
  final List<Lecture> lectureList = [];

}

class LectureDefault extends LectureState {
  final List<Lecture> lectureList = [
    Lecture(
      lectureID: 1,
      startTime: DateTime.now().add(const Duration(minutes: 10)),
      endTime: DateTime.now().add(const Duration(minutes: 20)),
      firstDate: DateTime.now(),
      hallLocation: 1,
      courseCode: 'CSE:234',

    ),
    Lecture(
      lectureID: 2,
      startTime: DateTime.now().subtract(const Duration(minutes: 10)),
      endTime: DateTime.now().add(const Duration(minutes: 20)),
      firstDate: DateTime.now(),
      hallLocation: 1,
      courseCode: 'CSE:235',

    ),
    Lecture(
      lectureID: 3,
      startTime: DateTime.now().subtract(const Duration(seconds: 40)),
      endTime: DateTime.now().add(const Duration(seconds: 40)),
      firstDate: DateTime.now(),
      hallLocation: 1,
      courseCode: 'CSE:236',

    ),
  ];

}

class LectureLoaded extends LectureState {
  final List<Lecture> lectureList;

  LectureLoaded({required this.lectureList});

}

class LectureSuccessState extends LectureState {
  final String message;

  LectureSuccessState({required this.message});

}

class LectureErrorState extends LectureState {
  final String error;

  LectureErrorState({required this.error});

}
