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

  void postStudentData(Student student){
       studentRepository.postStudentData(student).then((_){
         emit(StudentAdded(message: "Student posted successfully"));
         print("Student posted successfully");
       }).catchError((error){
         emit(StudentError(error: "Failed to post student"));
         print("Failed to post student");
       });
   }

   void printjson(Student student){
     print('Student: ${student.toJson()}');
   }


 void loadStudentById(int id) {
   studentRepository
       .getStudentDataById(id)
       .then((students) {
     emit(StudentLoaded(students: students));
   });
 }


 }



