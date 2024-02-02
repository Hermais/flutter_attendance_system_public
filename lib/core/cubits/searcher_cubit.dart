import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'searcher_state.dart';

class SearcherCubit extends Cubit<SearcherState> {
  SearcherCubit() : super(SearcherClosed());
}
