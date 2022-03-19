import 'package:flutter/material.dart';
import 'package:videostreaming/Pages/video_streaming.dart';
import 'package:videostreaming/Models/category_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../Models/video_model.dart';
import '../Widgets/VideoCard/video_thumbnail_card.dart';

class VideosScreen extends StatelessWidget {
  final CategoryModel categoryModel;
  const VideosScreen({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryModel.category_name)),
      body: ListView.builder(
        itemCount: categoryModel.videos.length,
        itemBuilder: (context, index) {
          VideoModel videoModel =
              VideoModel.fromMap(categoryModel.videos[index]);
          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId:
                YoutubePlayerController.convertUrlToId(videoModel.video_url) ??
                    "",
            params: const YoutubePlayerParams(
              playsInline: true,
              startAt: Duration(seconds: 0),
              autoPlay: true,
              useHybridComposition: true,
              showControls: true,
              showFullscreenButton: true,
              strictRelatedVideos: true,
            ),
          );

          return VideoThumbNailCard(
            videoModel: videoModel,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return VideoStreamingScreen(
                    videoModel: videoModel,
                    controller: controller,
                  );
                },
              ));
            },
          );
        },
      ),
    );
  }
}
