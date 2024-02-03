part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {

}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  CourseLoaded({required this.courses});

}

class CourseLoading extends CourseState {

}

class CourseFailed extends CourseState {
  String? message;

  CourseFailed({this.message});

}