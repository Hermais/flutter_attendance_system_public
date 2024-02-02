import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/instructor_model.dart';
import '../data/repositories/instructor_repository.dart';

part 'instructor_state.dart';

class InstructorCubit extends Cubit<InstructorState> {
  InstructorRepository instructorRepository;

  InstructorCubit({required this.instructorRepository})
      : super(InstructorInitial());

  void loadInstructor() async {
    emit(InstructorInitial());

    try{
      await instructorRepository.getInstructorData().then((instructors) {
        emit(InstructorLoaded(instructors: instructors));
      });
    }catch(e){
      emit(InstructorError(error: "Failed to load data. Try again later."));
    }
  }

  void loadInstructorByDepartment(String department) {
    instructorRepository
        .getInstructorDataByDepartment(department)
        .then((instructors) {
      emit(InstructorLoaded(instructors: instructors));
    });
  }

  void loadInstructorById(int id) {
    instructorRepository.getInstructorDataById(id).then((instructor) {
      emit(InstructorLoaded(instructors: instructor));
    });
  }

  void postInstructorData(Instructor instructor) async {
    try {
      await instructorRepository.postInstructorData(instructor);
      emit(InstructorAdded(message: "Instructor posted successfully"));
      print("Instructor posted successfully");
    } catch (e) {
      emit(InstructorError(error: "Failed to post instructor."));
      print("Failed to post instructor.");
    }
  }

  void loadInstructorsByStudentId(int id) {
    instructorRepository.getInstructorByStudentId(id).then((instructors) {
      emit(InstructorLoaded(instructors: instructors));
    });
  }
}
