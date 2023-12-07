import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/example_model.dart';
import '../../repositories/example_repository.dart';

part 'example_student_state.dart';

/// This cubit is used to manage the state of the Example Students.
class ExampleStudentCubit extends Cubit<ExampleStudentState> {
  late List<ExampleStudent> exampleStudents;
  final ExampleStudentRepository exampleStudentRepository;

  ExampleStudentCubit(this.exampleStudentRepository) : super(ExampleStudentInitial());

  // This method is used to load the data from the repository.
  List<ExampleStudent> loadExampleStudentData() {
    exampleStudentRepository.getExampleStudentData().then((exampleStudents) {
      this.exampleStudents = exampleStudents;
      emit(ExampleStudentLoaded(exampleStudents: exampleStudents));
    });
    return exampleStudents;

  }


}
