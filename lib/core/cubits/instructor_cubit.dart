import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/instructor_model.dart';
import '../data/repositories/instructor_repository.dart';

part 'instructor_state.dart';

class InstructorCubit extends Cubit<InstructorState> {
  InstructorRepository instructorRepository;

  InstructorCubit({required this.instructorRepository})
      : super(InstructorInitial());

  void loadInstructor() {
    instructorRepository.getInstructorData().then((instructors) {
      emit(InstructorLoaded(instructors: instructors));
    });
  }

  void loadInstructorByDepartment(String department) {
    instructorRepository
        .getInstructorDataByDepartment(department)
        .then((instructors) {
      emit(InstructorLoaded(instructors: instructors));
    });
  }
  void loadInstructorById(int id) {
    instructorRepository
        .getInstructorDataById(id)
        .then((instructor) {
      emit(InstructorLoaded(instructors: instructor));
    });
  }

  void postInstructorData(Instructor instructor){
    instructorRepository.postInstructorData(instructor).then((_){
      emit(InstructorAdded(message: "Instructor posted successfully"));
      print("Instructor posted successfully");
    }).catchError((error){
      emit(InstructorError(error: "Failed to post instructor"));
      print("Failed to post instructordent");
    });
  }


}