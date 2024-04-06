import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mpa/modules/home/models/MusicModel.dart';

class DetailPage extends StatefulWidget {
  static const String route = '/detail';

  const DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  late final MusicModel item;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as MusicModel;
    assetsAudioPlayer.open(
      Audio.network(item.audioUrl!),
      autoStart: false,
      showNotification: true,
    );
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
                height: MediaQuery.of(context).size.height * 0.5,
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
                ],
              ),
              // Gap
              const SizedBox(
                height: 30,
              ),
              // Play / Pause button
              StreamBuilder(
                stream: assetsAudioPlayer.isPlaying,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return IconButton(
                    onPressed: () {
                      assetsAudioPlayer.playOrPause();
                    },
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
