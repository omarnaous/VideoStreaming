import 'package:flutter/material.dart';
import 'package:videostreaming/Models/video_model.dart';
import 'package:videostreaming/Widgets/custom_image.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerCard extends StatelessWidget {
  const VideoPlayerCard({
    Key? key,
    required this.controller,
    required this.videoModel,
  }) : super(key: key);

  final YoutubePlayerController controller;
  final VideoModel videoModel;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerControllerProvider(
      controller: controller,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: YoutubeValueBuilder(
              controller: controller,
              builder: (context, value) {
                return AnimatedCrossFade(
                  firstChild: Center(
                      child: Card(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: YoutubePlayerIFrame(controller: controller)),
                  )),
                  secondChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CustomNetworkImage(
                              imageUrl: YoutubePlayerController.getThumbnail(
                                videoId: YoutubePlayerController.convertUrlToId(
                                        videoModel.video_url) ??
                                    "",
                                quality: ThumbnailQuality.medium,
                              ),
                              imageWidth: 500),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      ],
                    ),
                  ),
                  crossFadeState: value.isReady
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
