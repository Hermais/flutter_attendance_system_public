import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/example_model.dart';

part 'example_student_state.dart';

class ExampleStudentCubit extends Cubit<ExampleStudentState> {
  ExampleStudentCubit() : super(ExampleStudentInitial());
}
