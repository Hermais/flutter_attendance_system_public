part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {

}

class CourseLoaded extends CourseState {
  final List<Course> course;

  CourseLoaded({required this.course});

}
