import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:videostreaming/Models/video_model.dart';
import 'package:videostreaming/Widgets/VideoCard/video_title_row.dart';

import '../custom_image.dart';

class VideoThumbNailCard extends StatelessWidget {
  final VideoModel videoModel;
  final Function onTap;

  const VideoThumbNailCard({
    Key? key,
    required this.videoModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Card(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                  imageUrl: YoutubePlayerController.getThumbnail(
                      videoId: YoutubePlayerController.convertUrlToId(
                              videoModel.video_url) ??
                          ""),
                  imageWidth: null),
              VideoTitleRow(
                  title: videoModel.video_title,
                  videoDuration: videoModel.video_duration),
            ],
          ),
        ),
      ),
    );
  }
}
