import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mpa/modules/home/models/MusicModel.dart';

import '../bloc/detail.dart';

class DetailPage extends StatefulWidget {
  static const String route = '/detail/';
  final String id;
  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    BlocProvider.of<DetailBloc>(context).add(LoadDetail(
      widget.id,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if (state is DetailLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is DetailLoaded) {
          assetsAudioPlayer.open(
            Audio.network(state.item.audioUrl!),
            autoStart: false,
            showNotification: true,
          );
          return _buildView(state.item);
        }
        if (state is MetaDataUpdated) {
          return _buildView(state.item);
        }
        return const SizedBox();
      },
    );
  }

  _buildView(MusicModel item) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Listening to",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Gap
              const SizedBox(
                height: 20,
              ),
              // Hero animation
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: Hero(
                    tag: item.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      child: Image.network(
                        item.image,
                      ),
                    ),
                  ),
                ),
              ),
              // Gap
              const SizedBox(
                height: 20,
              ),
              // Info about the song
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.artist,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  // Favorite button
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<DetailBloc>(context).add(
                        SongFavorite(
                          item.id,
                          !item.isFavorite,
                        ),
                      );
                    },
                    icon: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ],
              ),
              // Gap
              const SizedBox(
                height: 30,
              ),
              // Slider
              assetsAudioPlayer.builderRealtimePlayingInfos(
                builder: (context, RealtimePlayingInfos infos) {
                  return Column(
                    children: [
                      Slider(
                        value: infos.currentPosition.inSeconds.toDouble(),
                        onChanged: (value) {
                          assetsAudioPlayer.seek(
                            Duration(
                              seconds: value.toInt(),
                            ),
                          );
                        },
                        min: 0,
                        max: infos.duration.inSeconds.toDouble(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Text(
                              getDuration(infos.currentPosition.inSeconds),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              getDuration(infos.duration.inSeconds),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),

              // Play / Pause button
              StreamBuilder(
                stream: assetsAudioPlayer.isPlaying,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return IconButton(
                    onPressed: () {
                      assetsAudioPlayer.playOrPause();
                    },
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      snapshot.data ?? false
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill,
                    ),
                    iconSize: 80,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getDuration(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return "$minutes:$remainingSeconds";
  }
}
