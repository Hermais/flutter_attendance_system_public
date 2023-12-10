part of 'lecture_cubit.dart';

@immutable
abstract class LectureState {}

class LectureInitial extends LectureState {

}

class LectureLoaded extends LectureState {
  final List<Lecture> lecture;

  LectureLoaded({required this.lecture});

}