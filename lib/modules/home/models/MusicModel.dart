// Model for music

class MusicModel {
  final String id;
  final String image;
  final String title;
  final String artist;
  String? audioUrl;
  bool isFavorite;

  MusicModel(
    this.id,
    this.image,
    this.title,
    this.artist,
    this.audioUrl, [
    this.isFavorite = false,
  ]);
}
