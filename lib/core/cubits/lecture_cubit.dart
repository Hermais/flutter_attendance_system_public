import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/lecture_model.dart';
import '../data/repositories/lectuer_repository.dart';

part 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {

  LectureRepository lectureRepository;

  LectureCubit({required this.lectureRepository}) : super(LectureInitial());



  void loadLecture() {
    lectureRepository.getLecture().then((lecture) {
      emit(LectureLoaded(lecture: lecture));
    });
  }

  void loadDefault() {
    emit(LectureDefault());
  }
}
