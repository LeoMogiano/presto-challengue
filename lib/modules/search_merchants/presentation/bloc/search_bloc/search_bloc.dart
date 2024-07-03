import 'package:bloc/bloc.dart';
import 'package:prestochallengue/modules/search_merchants/presentation/bloc/search_bloc/search_event.dart';
import 'package:prestochallengue/modules/search_merchants/presentation/bloc/search_bloc/search_state.dart';

import '../../../data/repositories/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(super.initialState);
}
