import 'package:bloc/bloc.dart';
import 'package:flutter_attendance_system/core/data/models/auth_get_model.dart';
import 'package:meta/meta.dart';

import '../data/models/auth_post_model.dart';
import '../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(AuthInitial());


  void postAuth(AuthPost auth) async {
    emit(AuthLoading());

    try {
      final response = await authRepository.postAuth(auth);
      emit(AuthSuccess(authGet: AuthGet.fromJson(response)));
    } catch (e) {
      print(e);
      emit(AuthFailed(message: e.toString().split("Exception: ")[1]));
    }
  }

}
