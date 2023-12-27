import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/course_model.dart';
import '../data/repositories/course_repository.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {

  CourseRepository courseRepository;

  CourseCubit({required this.courseRepository}) : super(CourseInitial());



  void loadCourse() {
    courseRepository.getCourse().then((courses) {
      emit(CourseLoaded(courses: courses));
    });
  }

  void loadCourseByDepartment(String department) {
    courseRepository.getCourseByDepartment(department).then((courses) {
      emit(CourseLoaded(courses: courses));
    });
  }

  void loadCourseByInstructorId(int instructorId) {
    courseRepository.getCourseByInstructorId(instructorId).then((courses) {
      emit(CourseLoaded(courses: courses));
    });
  }
}
