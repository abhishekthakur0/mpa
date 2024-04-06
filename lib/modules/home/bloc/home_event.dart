import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeLoad extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeSearch extends HomeEvent {
  final String query;

  const HomeSearch(this.query);

  @override
  List<Object> get props => [query];
}

class HomeFavorite extends HomeEvent {
  final String id;
  final bool isFavorite;

  const HomeFavorite(this.id, this.isFavorite);

  @override
  List<Object> get props => [id];
}
