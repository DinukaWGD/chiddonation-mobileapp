import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VidioPlayer extends StatefulWidget {
  final String vidioURL;
  const VidioPlayer({super.key, required this.vidioURL});

  @override
  State<VidioPlayer> createState() => _VidioPlayerState();
}

class _VidioPlayerState extends State<VidioPlayer> {
  late VideoPlayerController vidioplayercontroller;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    vidioplayercontroller =
        VideoPlayerController.networkUrl(Uri.parse(widget.vidioURL));
    initializeVideoPlayerFuture = vidioplayercontroller.initialize().then((_) {
      vidioplayercontroller.play();
      vidioplayercontroller.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    vidioplayercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (contexxt, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
                aspectRatio: vidioplayercontroller.value.aspectRatio,
                child: VideoPlayer(vidioplayercontroller)),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: initializeVideoPlayerFuture,
    );
  }
}
