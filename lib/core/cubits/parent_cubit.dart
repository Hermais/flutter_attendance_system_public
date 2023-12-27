import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/parent_model.dart';
import '../data/repositories/parent_repository.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {

  ParentRepository parentRepository;

  ParentCubit({required this.parentRepository}) : super(ParentInitial());



  void loadParent() {
    parentRepository.getParentData().then((parent) {
      emit(ParentLoaded(parents: parent));
    });
  }

  void loadParentById(int id) {
    parentRepository.getParentDataById(id).then((parent) {
      emit(ParentLoaded(parents: parent));
    });
  }
}
