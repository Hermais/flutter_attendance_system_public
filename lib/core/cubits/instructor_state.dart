part of 'instructor_cubit.dart';

@immutable
abstract class InstructorState {}

class InstructorInitial extends InstructorState {}

class InstructorLoaded extends InstructorState {
  final List<Instructor>? instructors;
  final Instructor? instructor;

  InstructorLoaded({this.instructor,  this.instructors});

}