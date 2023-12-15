part of 'student_cubit.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoaded extends StudentState {
  final List<Student> students;

  StudentLoaded({required this.students});

}