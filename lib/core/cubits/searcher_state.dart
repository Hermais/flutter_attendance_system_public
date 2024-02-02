part of 'searcher_cubit.dart';

@immutable
abstract class SearcherState {}

class SearcherClosed extends SearcherState {}
class SearcherOpened extends SearcherState {}
