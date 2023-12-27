part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthSuccess extends AuthState {
  final AuthGet authGet;
  AuthSuccess({required this.authGet});

}
class AuthFailed extends AuthState {}
class AuthLoading extends AuthState {}
