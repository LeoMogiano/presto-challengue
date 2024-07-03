import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSearchMerchat extends SearchEvent {
  final String _term;

  OnSearchMerchat({
    required String termn,
  }) : _term = termn;
}
