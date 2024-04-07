import 'dart:async';

import 'package:mpa/modules/home/bloc/home.dart';

import 'detail.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  late final HomeBloc _homeBloc;
  late StreamSubscription _homeBlocSubscription;
  String? id;
  DetailBloc({required HomeBloc homeBloc})
      : _homeBloc = homeBloc,
        super(DetailInitial()) {
    on<LoadDetail>((event, emit) async {
      emit(DetailLoading());
      try {
        final items = _homeBloc.songs;
        id = event.id;
        final item = items.firstWhere((element) => element.id == event.id);

        emit(DetailLoaded(
          item,
        ));
      } catch (e) {
        emit(DetailError(e.toString()));
      }
    });
    on<SongFavorite>((event, emit) {
      _homeBloc.add(HomeFavorite(event.id, event.isFavorite));
    });
    on<UpdateMetaData>((event, emit) {
      final items = _homeBloc.songs;
      final item = items.firstWhere((element) => element.id == id);
      emit(MetaDataUpdated(item));
    });

    // Listen for changes in songs list
    _homeBlocSubscription = _homeBloc.stream.listen((state) {
      if (state is HomeLoaded) {
        add(const UpdateMetaData());
      }
    });
  }

  @override
  Future<void> close() {
    _homeBlocSubscription.cancel();
    return super.close();
  }
}
