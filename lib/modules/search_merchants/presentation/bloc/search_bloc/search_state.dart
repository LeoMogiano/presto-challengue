import 'package:equatable/equatable.dart';

import '../../../data/models/merchat.dart';

class SearchState extends Equatable {
  final List<Merchat>? searchResult;
  final bool? isLoadingListOfSearch;

  const SearchState({
    this.searchResult,
    this.isLoadingListOfSearch,
  });

  @override
  List<Object?> get props => [searchResult, isLoadingListOfSearch];

  SearchState copyWith({
    List<Merchat>? searchResult,
    bool? isLoadingListOfSearch,
  }) =>
      SearchState(
        searchResult: searchResult ?? this.searchResult,
        isLoadingListOfSearch:
            isLoadingListOfSearch ?? this.isLoadingListOfSearch,
      );
}
