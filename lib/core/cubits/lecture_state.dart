part of 'lecture_cubit.dart';

@immutable
abstract class LectureState {
  final List<Lecture> lecture = [];

}

class LectureInitial extends LectureState {
  final List<Lecture> lecture = [];

}

class LectureDefault extends LectureState {
  final List<Lecture> lecture = [];

}

class LectureLoaded extends LectureState {
  final List<Lecture> lecture;

  LectureLoaded({required this.lecture});

}