part of 'example_student_cubit.dart';

/// In this file we define the states of the cubit.

@immutable
abstract class ExampleStudentState {}

class ExampleStudentInitial extends ExampleStudentState {}

/// This state is used to indicate that the data is loaded successfully.
class ExampleStudentLoaded extends ExampleStudentState {
  final List<ExampleStudent> exampleStudents;


  ExampleStudentLoaded({required this.exampleStudents});
}

/// You can create more states if you want, for example:
/// class ExampleStudentError extends ExampleStudentState {}
/// class ExampleStudentLoading extends ExampleStudentState {}
/// class ExampleStudentEmpty extends ExampleStudentState {}
