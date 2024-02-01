import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/lecture_model.dart';
import '../data/repositories/lecture_repository.dart';

part 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureRepository lectureRepository;

  LectureCubit({required this.lectureRepository}) : super(LectureInitial());

  void loadLecture() {
    lectureRepository.getLecture().then((lecture) {
      emit(LectureLoaded(lectureList: lecture));
    });
  }

  void getLecturesByDay(
      {required String day,
      required String department,
      required int academicYear}) {
    lectureRepository
        .getLecturesByDay(
            day: day, department: department, academicYear: academicYear)
        .then((lecture) {
      emit(LectureLoaded(lectureList: lecture));
    });
  }

  void postLecture(Lecture lecture) async {
    try {
      await lectureRepository.postLecture(lecture);
      emit(LecturePostSuccess(message: 'Lecture Added Successfully'));
    } catch (e) {
      emit(LecturePostError(error: e.toString()));
    }
  }

  void loadDefault() {
    emit(LectureDefault());
  }

  void loadLectureTimeTableByDay(int id, String dayOfWeek) {
    lectureRepository
        .getLectureTimeTableByDay(id, dayOfWeek)
        .then((lectureList) {
      emit(LectureLoaded(lectureList: lectureList));
    });
  }

  void loadLectureOfInstructorById(int id) {
    lectureRepository.getLectureOfInstructorById(id).then((lectureList) {
      emit(LectureLoaded(lectureList: lectureList));
    });
  }
}
