import 'package:flutter/material.dart';

class VideoTitleRow extends StatelessWidget {
  const VideoTitleRow({
    Key? key,
    required this.title,
    required this.videoDuration,
  }) : super(key: key);

  final String title;
  final String videoDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                videoDuration,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}