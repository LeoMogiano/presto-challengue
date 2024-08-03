import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prestochallengue/modules/search_merchants/data/models/models.dart';
import 'package:prestochallengue/modules/search_merchants/data/repositories/search_repository.impl.dart';

part 'search_event.dart';
part 'search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final SearchRepositoryImpl searchRepository;
  SearchBloc( {
    required this.searchRepository
  }) : super(const SearchState()) {

    on<OnSearchMerchat>(_handleSearchEvent);
    on<OnSearchFavoriteMerchat>(_handleSearchFavoriteEvent);
    on<OnAddFavoriteMerchat>(_handleAddFavoriteEvent);
  }

  void _handleSearchEvent(OnSearchMerchat event, Emitter<SearchState> emit) async {
      emit(state.copyWith(isLoadingListOfSearch: true, favoriteMerchants: []));
      try {
        final merchants = await searchRepository.searchMerchat(termn: event.term);
        emit(state.copyWith(searchResult: merchants, isLoadingListOfSearch: false));
      } catch (e) {
         emit(state.copyWith(isLoadingListOfSearch: false));
        throw Exception("Error al buscar: $e");
      }
      emit(state.copyWith(isLoadingListOfSearch: false));
  }

  void _handleSearchFavoriteEvent(OnSearchFavoriteMerchat event, Emitter<SearchState> emit) async {
      emit(state.copyWith(isLoadingListOfSearch: true, searchResult: []));
      try {
        final favorite = await searchRepository.searchFavoriteMerchat();
        emit(state.copyWith(favoriteMerchants: favorite, isLoadingListOfSearch: false));
      } catch (e) {
         emit(state.copyWith(isLoadingListOfSearch: false));
        throw Exception("Error al buscar: $e");
      }
      emit(state.copyWith(isLoadingListOfSearch: false));
  }

  void _handleAddFavoriteEvent(OnAddFavoriteMerchat event, Emitter<SearchState> emit) async {
    try {
      await searchRepository.addFavoriteMerchant(id: event.id);
      emit(state.copyWith(isLoadingListOfSearch: false));
    } catch (e) {
      emit(state.copyWith(isLoadingListOfSearch: false));
      throw Exception("Error al buscar: $e");
    }
    emit(state.copyWith(isLoadingListOfSearch: false));
  }

}
