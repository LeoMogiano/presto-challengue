part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSearchMerchat extends SearchEvent {
  final String term;

  OnSearchMerchat({required this.term});
}

class OnSearchFavoriteMerchat extends SearchEvent {}

class OnAddFavoriteMerchat extends SearchEvent {
  final String id;

  OnAddFavoriteMerchat({required this.id});
}
