part of 'halls_cubit.dart';

@immutable
abstract class HallsState {}

class HallsInitial extends HallsState {}

class HallsLoaded extends HallsState {
  final List<String> halls;
  HallsLoaded({required this.halls});
}

class HallsLoading extends HallsState {}
class HallsFailed extends HallsState {}
