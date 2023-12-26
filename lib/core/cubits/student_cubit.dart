import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/student_model.dart';
import '../data/repositories/student_repository.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
 StudentRepository studentRepository;
  StudentCubit({required this.studentRepository}) : super(StudentInitial());

 void loadStudent() {
   studentRepository.getStudentData().then((students) {
     emit(StudentLoaded(students: students));
   });
 }

 Future<void> postStudentData(Student student) async {
   emit(addStudenloaded());
   try{
      await studentRepository.postStudentData(student);
       emit(StudentAdded('successfully'));
     } catch(e){
       emit(StudentError('No success'));
     }
   }
 }

