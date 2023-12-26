part of 'instructor_cubit.dart';

@immutable
abstract class InstructorState {}

class InstructorInitial extends InstructorState {}

class InstructorLoaded extends InstructorState {
  final List<Instructor> instructors;

  InstructorLoaded({required this.instructors});
}

class InstructorSuccessState extends InstructorState {
  final String message;

  InstructorSuccessState({required this.message});
}

class InstructorErrorState extends InstructorState {
  final String error;

  InstructorErrorState({required this.error});
}
