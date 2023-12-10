import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/faculty_admin_model.dart';
import '../data/repositories/faculty_admin_repository.dart';

part 'faculty_admin_state.dart';

class FacultyAdminCubit extends Cubit<FacultyAdminState> {

  FacultyAdminRepository facultyAdminRepository;

  FacultyAdminCubit({required this.facultyAdminRepository}) : super(FacultyAdminInitial());



  void loadFacultyAdmin() {
    facultyAdminRepository.getFacultyAdminData().then((facultyAdmin) {
      emit(FacultyAdminLoaded(facultyAdmin: facultyAdmin));
    });
  }

  void addLecture() {

  }
}