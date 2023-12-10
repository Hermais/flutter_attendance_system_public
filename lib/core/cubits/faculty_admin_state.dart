part of 'faculty_admin_cubit.dart';

@immutable
abstract class FacultyAdminState {}

class FacultyAdminInitial extends FacultyAdminState {

}

class FacultyAdminLoaded extends FacultyAdminState {
  final List<FacultyAdmin> facultyAdmin;

  FacultyAdminLoaded({required this.facultyAdmin});

}
