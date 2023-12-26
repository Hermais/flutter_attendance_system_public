part of 'student_cubit.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoaded extends StudentState {
  final List<Student> students;

  StudentLoaded({required this.students});

}
///post state

class addStudentInitial extends StudentState {}

class addStudenloaded extends StudentState {}

class StudentAdded extends StudentState {
  final String message;

  StudentAdded(this.message);
}

class StudentError extends StudentState {
  final String error;

  StudentError(this.error);
}