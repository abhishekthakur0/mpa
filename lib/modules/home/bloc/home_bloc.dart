import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/MusicModel.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late List<MusicModel> songs;

  HomeBloc() : super(HomeInitial()) {
    on<HomeLoad>((event, emit) async {
      emit(HomeLoading());
      songs = await getSongs();
      await getFavorites().then((favorites) {
        for (var song in songs) {
          song.isFavorite = favorites.contains(song.id);
        }
      });
      emit(HomeLoaded(songs));
    });
    on<HomeSearch>((event, emit) {
      final query = event.query;
      final searchResults = songs.where((song) {
        return song.title.toLowerCase().contains(query.toLowerCase()) ||
            song.artist.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(HomeLoaded(searchResults));
    });
    on<HomeFavorite>((event, emit) {
      final id = event.id;
      final isFavorite = event.isFavorite;
      final song = songs.firstWhere((song) => song.id == id);
      song.isFavorite = isFavorite;
      emit(HomeInitial());
      storeFavorite(id, isFavorite);
      emit(HomeLoaded(songs));
    });
  }

  Future<List<MusicModel>> getSongs() async {
    final List<MusicModel> songs = [];
    await FirebaseFirestore.instance.collection("songs").get().then((value) {
      for (var song in value.docs) {
        songs.add(MusicModel(
          song.id,
          song["image"],
          song["title"],
          song["artist"],
          song["audioUrl"],
        ));
      }
    });
    return songs;
  }

  void storeFavorite(String id, bool isFavorite) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    if (isFavorite) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("favorites")
          .doc(id)
          .set({
        "id": id,
        "mark": isFavorite,
      });
    } else {
      FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("favorites")
          .doc(id)
          .delete();
    }
  }

  Future<List<String>> getFavorites() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final favorites = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("favorites")
        .get()
        .then((value) {
      return value.docs.map((e) => e.id).toList();
    });
    return favorites;
  }
}
