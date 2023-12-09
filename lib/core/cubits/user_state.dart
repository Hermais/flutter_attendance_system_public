part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {

}

class UserLoaded extends UserState {
  final List<User> users;

    UserLoaded({required this.users});

}
