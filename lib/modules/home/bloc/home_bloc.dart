import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/MusicModel.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final List<MusicModel> _songs = [
  //   MusicModel(
  //     "id1",
  //     "https://pagalnew.com/coverimages/Piya-Tose-Naina-Lage-Re-Guide-500-500.jpg",
  //     "Piya Tose Naina Lage Re",
  //     "Lata Mangeshkar",
  //     Audio(
  //       "assets/songs/Piya Tose Naina Lage Re Guide 128 Kbps.mp3",
  //       metas: Metas(
  //         title: "Piya Tose Naina Lage Re",
  //         artist: "Lata Mangeshkar",
  //         album: "Guide",
  //         image: const MetasImage.network(
  //           "https://pagalnew.com/coverimages/Piya-Tose-Naina-Lage-Re-Guide-500-500.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id2",
  //     "https://pagalfree.com/images/128Raina%20Beeti%20Jaye%20-%20Amar%20Prem%20128%20Kbps.jpg",
  //     "Raina Beeti Jaye",
  //     "Lata Mangeshkar",
  //     Audio(
  //       "assets/songs/Raina Beeti Jaye - Amar Prem 128 Kbps.mp3",
  //       metas: Metas(
  //         title: "Raina Beeti Jaye",
  //         artist: "Lata Mangeshkar",
  //         album: "Amar Prem",
  //         image: const MetasImage.network(
  //           "https://pagalfree.com/images/128Raina%20Beeti%20Jaye%20-%20Amar%20Prem%20128%20Kbps.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id3",
  //     "https://pagalfree.com/images/128Yara%20Seeli%20Seeli%20-%20Lekin%20128%20Kbps.jpg",
  //     "Yara Seeli Seeli",
  //     "Lata Mangeshkar",
  //     Audio(
  //       "assets/songs/Yara Seeli Seeli - Lekin 128 Kbps.mp3",
  //       metas: Metas(
  //         title: "Yara Seeli Seeli",
  //         artist: "Lata Mangeshkar",
  //         album: "Lekin",
  //         image: const MetasImage.network(
  //           "https://pagalfree.com/images/128Yara%20Seeli%20Seeli%20-%20Lekin%20128%20Kbps.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id4",
  //     "https://pagalfree.com/images/128Aaja%20Piya%20Tohe%20Pyar%20Doon%20-%20Baharon%20Ke%20Sapne%20128%20Kbps.jpg",
  //     "Aaja Piya Tohe Pyar Doon",
  //     "Lata Mangeshkar",
  //     "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FAaja%20Piya%20Tohe%20Pyar%20Doon%20-%20Baharon%20Ke%20Sapne%20128%20Kbps.mp3?alt=media&token=09372a41-69e1-4b36-b0ec-e6b3adc76c76",
  //     Audio(
  //       "assets/songs/Aaja Piya Tohe Pyar Doon - Baharon Ke Sapne 128 Kbps.mp3",
  //       metas: Metas(
  //         title: "Aaja Piya Tohe Pyar Doon",
  //         artist: "Lata Mangeshkar",
  //         album: "Baharon Ke Sapne",
  //         image: const MetasImage.network(
  //           "https://pagalfree.com/images/128Aaja%20Piya%20Tohe%20Pyar%20Doon%20-%20Baharon%20Ke%20Sapne%20128%20Kbps.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id5",
  //     "https://www.pagalworld.online/GpE34Kg9Gq/113604/152315-zaalim-mp3-song-300.jpg",
  //     "Zaalim",
  //     "Badshah, Payal Dev",
  //     Audio(
  //       "assets/songs/Zaalim - Badshah.mp3",
  //       metas: Metas(
  //         title: "Zaalim",
  //         artist: "Badshah, Payal Dev",
  //         album: "Zaalim",
  //         image: const MetasImage.network(
  //           "https://www.pagalworld.online/GpE34Kg9Gq/113604/152315-zaalim-mp3-song-300.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id6",
  //     "https://www.pagalworld.com.cm/siteuploads/thumb/sft135/67444_4.jpg",
  //     "Heeriye",
  //     "Arijit Singh, Jasleen Royal",
  //     Audio(
  //       "assets/songs/Heeriye(PagalWorld.com.cm).mp3",
  //       metas: Metas(
  //         title: "Heeriye",
  //         artist: "Arijit Singh, Jasleen Royal",
  //         album: "Heeriye",
  //         image: const MetasImage.network(
  //           "https://www.pagalworld.com.cm/siteuploads/thumb/sft135/67444_4.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id7",
  //     "https://www.pagalworld.com.cm/siteuploads/thumb/sft142/70692_4.jpg",
  //     "Silsila Ye Chahat Ka",
  //     "Shreya Ghoshal",
  //     Audio(
  //       "assets/songs/Silsila Ye Chahat Ka Remix(PagalWorld.com.cm).mp3",
  //       metas: Metas(
  //         title: "Silsila Ye Chahat Ka",
  //         artist: "Shreya Ghoshal",
  //         album: "Silsila Ye Chahat Ka",
  //         image: const MetasImage.network(
  //           "https://www.pagalworld.com.cm/siteuploads/thumb/sft142/70692_4.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id8",
  //     "https://pagalnew.com/coverimages/Tere-Liye-Veer-Zaara-500-500.jpg",
  //     "Tere Liye",
  //     "Lata Mangeshkar, Roop Kumar Rathod",
  //     Audio(
  //       "assets/songs/Tere Liye Veer Zaara 128 Kbps.mp3",
  //       metas: Metas(
  //         title: "Tere Liye",
  //         artist: "Lata Mangeshkar, Roop Kumar Rathod",
  //         album: "Veer Zaara",
  //         image: const MetasImage.network(
  //           "https://pagalnew.com/coverimages/Tere-Liye-Veer-Zaara-500-500.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id9",
  //     "https://hindi.djpunjab.app/cover/e8zBIyN9OBPDbI6wbfAV5Q==/dil-mein-ek-lehar-si-uthi-hai-abhi-ghulam-ali-cover-image.webp",
  //     "Itni Muddat Baad Mile Ho",
  //     "Ghulam Ali",
  //     Audio(
  //       "assets/songs/Itni Muddat Baad Mile Ho.mp3",
  //       metas: Metas(
  //         title: "Itni Muddat Baad Mile Ho",
  //         artist: "Ghulam Ali",
  //         album: "Ghulam Ali",
  //         image: const MetasImage.network(
  //           "https://hindi.djpunjab.app/cover/e8zBIyN9OBPDbI6wbfAV5Q==/dil-mein-ek-lehar-si-uthi-hai-abhi-ghulam-ali-cover-image.webp",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id10",
  //     "https://pagalworld.cool/siteuploads/thumb/sft3/1019_resize2x_250x250.webp",
  //     "Laado",
  //     "MC Square",
  //     Audio(
  //       "assets/songs/Laado_128-(PagalWorld).mp3",
  //       metas: Metas(
  //         title: "Laado",
  //         artist: "MC Square",
  //         album: "Laado",
  //         image: const MetasImage.network(
  //           "https://pagalworld.cool/siteuploads/thumb/sft3/1019_resize2x_250x250.webp",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id11",
  //     "https://pagalnew.com/coverimages/lagi-aaj-sawan-ki-chandni-1989-500-500.jpg",
  //     "Lagi Aaj Sawaan Ki",
  //     "Suresh Wadkar, Anupama Deshpande",
  //     Audio(
  //       "assets/songs/Lagi Aaj Sawan Ki Chandni 1989 128 Kbps.mp3",
  //       metas: Metas(
  //         title: "Lagi Aaj Sawaan Ki",
  //         artist: "Suresh Wadkar, Anupama Deshpande",
  //         album: "Chandni",
  //         image: const MetasImage.network(
  //           "https://pagalnew.com/coverimages/lagi-aaj-sawan-ki-chandni-1989-500-500.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  //   MusicModel(
  //     "id12",
  //     "https://pagalnew.com/coverimages/Not-Funny-Madgaon-Express-500-500.jpg",
  //     "Not Funny",
  //     "Shaarib, Akasa Singh",
  //     Audio(
  //       "assets/songs/Not Funny Madgaon Express 128 Kbps.mp3",
  //       metas: Metas(
  //         title: "Not Funny",
  //         artist: "Shaarib, Akasa Singh",
  //         album: "Madgaon Express",
  //         image: const MetasImage.network(
  //           "https://pagalnew.com/coverimages/Not-Funny-Madgaon-Express-500-500.jpg",
  //         ),
  //       ),
  //     ),
  //   ),
  // ];
  // final List<Map<String, dynamic>> songs = [
  //   {
  //     "id": "id1",
  //     "image":
  //         "https://pagalnew.com/coverimages/Piya-Tose-Naina-Lage-Re-Guide-500-500.jpg",
  //     "title": "Piya Tose Naina Lage Re",
  //     "artist": "Lata Mangeshkar",
  //     "album": "Guide",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FPiya%20Tose%20Naina%20Lage%20Re%20Guide%20128%20Kbps.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id2",
  //     "image":
  //         "https://pagalfree.com/images/128Raina%20Beeti%20Jaye%20-%20Amar%20Prem%20128%20Kbps.jpg",
  //     "title": "Raina Beeti Jaye",
  //     "artist": "Lata Mangeshkar",
  //     "album": "Amar Prem",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FRaina%20Beeti%20Jaye%20-%20Amar%20Prem%20128%20Kbps.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id3",
  //     "image":
  //         "https://pagalfree.com/images/128Yara%20Seeli%20Seeli%20-%20Lekin%20128%20Kbps.jpg",
  //     "title": "Yara Seeli Seeli",
  //     "artist": "Lata Mangeshkar",
  //     "album": "Lekin",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FYara%20Seeli%20Seeli%20-%20Lekin%20128%20Kbps.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id4",
  //     "image":
  //         "https://pagalfree.com/images/128Aaja%20Piya%20Tohe%20Pyar%20Doon%20-%20Baharon%20Ke%20Sapne%20128%20Kbps.jpg",
  //     "title": "Aaja Piya Tohe Pyar Doon",
  //     "artist": "Lata Mangeshkar",
  //     "album": "Baharon Ke Sapne",
  //     "audioUrl": "",
  //   },
  //   {
  //     "id": "id5",
  //     "image":
  //         "https://www.pagalworld.online/GpE34Kg9Gq/113604/152315-zaalim-mp3-song-300.jpg",
  //     "title": "Zaalim",
  //     "artist": "Badshah, Payal Dev",
  //     "album": "Zaalim",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FZaalim%20-%20Badshah.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id6",
  //     "image":
  //         "https://www.pagalworld.com.cm/siteuploads/thumb/sft135/67444_4.jpg",
  //     "title": "Heeriye",
  //     "artist": "Arijit Singh, Jasleen Royal",
  //     "album": "Heeriye",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FHeeriye(PagalWorld.com.cm).mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id7",
  //     "image":
  //         "https://www.pagalworld.com.cm/siteuploads/thumb/sft142/70692_4.jpg",
  //     "title": "Silsila Ye Chahat Ka",
  //     "artist": "Shreya Ghoshal",
  //     "album": "Silsila Ye Chahat Ka",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FSilsila%20Ye%20Chahat%20Ka%20Remix(PagalWorld.com.cm).mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id8",
  //     "image":
  //         "https://pagalnew.com/coverimages/Tere-Liye-Veer-Zaara-500-500.jpg",
  //     "title": "Tere Liye",
  //     "artist": "Lata Mangeshkar, Roop Kumar Rathod",
  //     "album": "Veer Zaara",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FTere%20Liye%20Veer%20Zaara%20128%20Kbps.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id9",
  //     "image":
  //         "https://hindi.djpunjab.app/cover/e8zBIyN9OBPDbI6wbfAV5Q==/dil-mein-ek-lehar-si-uthi-hai-abhi-ghulam-ali-cover-image.webp",
  //     "title": "Itni Muddat Baad Mile Ho",
  //     "artist": "Ghulam Ali",
  //     "album": "Ghulam Ali",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FItni%20Muddat%20Baad%20Mile%20Ho.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id10",
  //     "image":
  //         "https://pagalworld.cool/siteuploads/thumb/sft3/1019_resize2x_250x250.webp",
  //     "title": "Laado",
  //     "artist": "MC Square",
  //     "album": "Laado",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FLaado_128-(PagalWorld).mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id11",
  //     "image":
  //         "https://pagalnew.com/coverimages/lagi-aaj-sawan-ki-chandni-1989-500-500.jpg",
  //     "title": "Lagi Aaj Sawaan Ki",
  //     "artist": "Suresh Wadkar, Anupama Deshpande",
  //     "album": "Chandni",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FLagi%20Aaj%20Sawan%20Ki%20Chandni%201989%20128%20Kbps.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  //   {
  //     "id": "id12",
  //     "image":
  //         "https://pagalnew.com/coverimages/Not-Funny-Madgaon-Express-500-500.jpg",
  //     "title": "Not Funny",
  //     "artist": "Shaarib, Akasa Singh",
  //     "album": "Madgaon Express",
  //     "audioUrl":
  //         "https://firebasestorage.googleapis.com/v0/b/music-playing-app.appspot.com/o/songs%2FNot%20Funny%20Madgaon%20Express%20128%20Kbps.mp3?alt=media&token=3b3b3b3b-3b3b-3b3b-3b3b-3b3b3b3b3b3b",
  //   },
  // ];
  late List<MusicModel> _songs;

  HomeBloc() : super(HomeInitial()) {
    on<HomeLoad>((event, emit) async {
      emit(HomeLoading());
      _songs = await getSongs();
      await getFavorites().then((favorites) {
        for (var song in _songs) {
          song.isFavorite = favorites.contains(song.id);
        }
      });
      emit(HomeLoaded(_songs));
    });
    on<HomeSearch>((event, emit) {
      final query = event.query;
      final searchResults = _songs.where((song) {
        return song.title.toLowerCase().contains(query.toLowerCase()) ||
            song.artist.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(HomeLoaded(searchResults));
    });
    on<HomeFavorite>((event, emit) {
      final id = event.id;
      final isFavorite = event.isFavorite;
      final song = _songs.firstWhere((song) => song.id == id);
      song.isFavorite = isFavorite;
      emit(HomeInitial());
      storeFavorite(id, isFavorite);
      emit(HomeLoaded(_songs));
    });
  }

  getSongs() async {
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
