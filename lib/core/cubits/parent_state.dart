part of 'parent_cubit.dart';

@immutable
abstract class ParentState {}

class ParentInitial extends ParentState {

}

class ParentLoaded extends ParentState {
  final List<Parent> parents;

  ParentLoaded({required this.parents});

}
