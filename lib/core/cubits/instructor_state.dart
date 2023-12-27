part of 'instructor_cubit.dart';

@immutable
abstract class InstructorState {}

class InstructorInitial extends InstructorState {}

class InstructorLoaded extends InstructorState {
  final List<Instructor>? instructors;
  final Instructor? instructor;

  InstructorLoaded({this.instructor,  this.instructors});

}
///post state

class addInstructorInitial extends InstructorState {}

class addInstructorloaded extends InstructorState {}

class InstructorAdded extends InstructorState {
  final String message;

  InstructorAdded({required this.message});
}

class InstructorError extends InstructorState {
  final String error;

  InstructorError({required this.error});
}