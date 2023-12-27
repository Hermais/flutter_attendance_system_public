import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/lecture_model.dart';

part 'lecture_manager_state.dart';

class LectureManagerCubit extends Cubit<LectureManagerState> {
  late Lecture lecture;

  LectureManagerCubit() : super(LectureManagerInitial());

  void checkLectureToStart(Lecture lecture) {
    this.lecture = lecture;
    lecture.startTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, lecture.startTime!.hour, lecture.startTime!.minute);
    lecture.endTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, lecture.endTime!.hour, lecture.endTime!.minute);


    if (state is LectureManagerInitial) {
      loadLecture();
    }

    if (lecture.startTime!.isBefore(DateTime.now()) &&
        lecture.endTime!.isAfter(DateTime.now())) {
      emit(LectureManagerInSession(lecture: lecture));
    } else {
      emit(LectureManagerFailed());
    }
  }

  void setInitial() {
    emit(LectureManagerInitial());
  }

  loadLecture() {
    emit(LectureManagerLoaded(lecture: lecture));
  }

  Lecture getCurrentLecture() {
    return lecture;
  }

  String getCurrentLectureName() {
    return lecture.courseCode!;
  }
}
