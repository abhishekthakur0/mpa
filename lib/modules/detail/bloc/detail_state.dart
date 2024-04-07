import 'package:equatable/equatable.dart';

import '../../home/models/MusicModel.dart';

abstract class DetailState extends Equatable {
  const DetailState();
}

class DetailInitial extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailLoading extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailLoaded extends DetailState {
  final MusicModel item;

  const DetailLoaded(
    this.item,
  );

  @override
  List<Object> get props => [item];
}

class DetailError extends DetailState {
  final String message;

  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}

class MetaDataUpdated extends DetailState {
  final MusicModel item;

  const MetaDataUpdated(this.item);

  @override
  List<Object> get props => [item];
}
