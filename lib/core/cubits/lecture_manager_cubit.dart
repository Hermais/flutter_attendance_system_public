import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/lecture_model.dart';

part 'lecture_manager_state.dart';

class LectureManagerCubit extends Cubit<LectureManagerState> {
  late Lecture lecture;
  LectureManagerCubit() : super(LectureManagerInitial());

  void checkLectureToStart(Lecture lecture) {
    this.lecture = lecture;

    if(state is LectureManagerInitial) {
      loadLecture();
    }

    if(lecture.startTime.isBefore(DateTime.now()) && lecture.endTime.isAfter(DateTime.now())) {
      emit(LectureInSession(lecture: lecture));
    }
    else {
      emit(LectureManagerFailed());
    }
  }

  loadLecture() {
    emit(LectureManagerLoaded(lecture: lecture));
  }

  Lecture getCurrentLecture() {
    return lecture;
  }

  String getCurrentLectureName() {
    return lecture.courseCourseCode;
  }

}
