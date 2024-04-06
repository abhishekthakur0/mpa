import 'package:equatable/equatable.dart';

import '../models/MusicModel.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<MusicModel> songs;

  const HomeLoaded(this.songs);

  @override
  List<Object> get props => [songs];
}
