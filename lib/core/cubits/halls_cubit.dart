import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repositories/halls_repository.dart';

part 'halls_state.dart';

class HallCubit extends Cubit<HallsState> {
  HallRepository hallRepository;
  HallCubit({required this.hallRepository}) : super(HallsInitial());

  void loadHalls() {
    hallRepository.getHalls().then((halls) {
      emit(HallsLoaded(halls: halls));
    });
  }
}
