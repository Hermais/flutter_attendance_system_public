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
}