part of 'lecture_manager_cubit.dart';

@immutable
abstract class LectureManagerState {

}

class LectureManagerInitial extends LectureManagerState {}
class LectureManagerLoaded extends LectureManagerState {
  final Lecture lecture;
  LectureManagerLoaded({required this.lecture});
}
class LectureManagerFailed extends LectureManagerState {}
class LectureInSession extends LectureManagerState {
  final Lecture lecture;
  LectureInSession({required this.lecture});

}