import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/example_model.dart';
import '../data/repositories/example_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;
  /// In the parent constructor you have to provide an initial state.
  /// that will stay as the initial state of the cubit unless a change
  /// is emitted.
  UserCubit({required this.userRepository}) : super(UserInitial());


  void loadUsers() {
    userRepository.getUsers().then((users) {
      emit(UserLoaded(users: users));
    });
  }

}
