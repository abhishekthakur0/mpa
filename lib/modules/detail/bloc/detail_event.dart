import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class LoadDetail extends DetailEvent {
  final String id;

  const LoadDetail(
    this.id,
  );

  @override
  List<Object> get props => [id];
}

class SongFavorite extends DetailEvent {
  final String id;
  final bool isFavorite;

  const SongFavorite(
    this.id,
    this.isFavorite,
  );

  @override
  List<Object> get props => [id, isFavorite];
}

class UpdateMetaData extends DetailEvent {
  const UpdateMetaData();

  @override
  List<Object> get props => [];
}
