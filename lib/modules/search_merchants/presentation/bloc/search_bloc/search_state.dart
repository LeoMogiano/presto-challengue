part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Merchat>? searchResult;
  final List<FavoriteMerchant>? favoriteMerchants;
  final bool? isLoadingListOfSearch;

  const SearchState({
    this.searchResult,
    this.favoriteMerchants,
    this.isLoadingListOfSearch,
  });

  @override
  List<Object?> get props => [searchResult, isLoadingListOfSearch];

  SearchState copyWith({
    List<Merchat>? searchResult,
    List<FavoriteMerchant>? favoriteMerchants,
    bool? isLoadingListOfSearch,
  }) =>
      SearchState(
        searchResult: searchResult ?? this.searchResult,
        favoriteMerchants: favoriteMerchants ?? this.favoriteMerchants,
        isLoadingListOfSearch:isLoadingListOfSearch ?? this.isLoadingListOfSearch,
      );
}
