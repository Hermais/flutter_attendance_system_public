import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/course_model.dart';
import '../data/repositories/course_repository.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {

  CourseRepository courseRepository;

  CourseCubit({required this.courseRepository}) : super(CourseInitial());



  void loadCourse() {
    emit(CourseLoading());
    courseRepository.getCourse().then((courses) {
      emit(CourseLoaded(courses: courses));
    });
  }

  void loadCourseByDepartmentForLecturePosting(String department) async {
    emit(CourseLoading());
    try{
      await courseRepository.getCourseByDepartment(department).then((courses) {
        emit(CourseLoaded(courses: courses));
      });
    }catch(e){
      emit(CourseFailed());

    }
  }
  void loadCourseByDepartmentForInstructorPosting(String department) {
    emit(CourseLoading());
    courseRepository.getCourseByDepartmentForInstructorPosting(department).then((courses) {
      emit(CourseLoaded(courses: courses));
    });
  }


  void loadCourseByInstructorId(int instructorId) {
    emit(CourseLoading());
    courseRepository.getCourseByInstructorId(instructorId).then((courses) {
      emit(CourseLoaded(courses: courses));
    });
  }


}
