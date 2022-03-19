import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loader_skeleton/loader_skeleton.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.imageWidth,
  }) : super(key: key);

  final String imageUrl;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        width: imageWidth,
        imageUrl: imageUrl,
        placeholder: (context, url) => CardPageSkeleton(
          totalLines: 2,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
