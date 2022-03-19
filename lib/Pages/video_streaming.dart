import 'package:flutter/material.dart';
import 'package:videostreaming/Widgets/video_player_card.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:videostreaming/Models/video_model.dart';

class VideoStreamingScreen extends StatefulWidget {
  final VideoModel videoModel;
  final YoutubePlayerController controller;

  const VideoStreamingScreen({
    Key? key,
    required this.videoModel,
    required this.controller,
  }) : super(key: key);

  @override
  State<VideoStreamingScreen> createState() => _VideoStreamingScreenState();
}

class _VideoStreamingScreenState extends State<VideoStreamingScreen> {
  @override
  void dispose() {
    widget.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoModel.video_title),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              widget.controller.close();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: SafeArea(
        child: VideoPlayerCard(
          controller: widget.controller,
          videoModel: widget.videoModel,
        ),
      ),
    );
  }
}
