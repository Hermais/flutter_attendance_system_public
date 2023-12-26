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

  void postLecture(Lecture lecture) {
    lectureRepository.postLecture(lecture).then((_) {
      emit(LectureSuccessState(message: "Lecture posted successfully"));
      print("Lecture posted successfully");
    }).catchError((error) {
      emit(LectureErrorState(error: "Failed to post lecture"));
      print("Failed to post lecture");
    });
  }

  void loadDefault() {
    emit(LectureDefault());
  }
}
