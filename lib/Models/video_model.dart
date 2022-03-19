// ignore_for_file: non_constant_identifier_names
class VideoModel {
  final int category_id;
  final String video_url;
  final String video_title;
  final String video_duration;

  
  VideoModel({
    required this.category_id,
    required this.video_url,
    required this.video_title,
    required this.video_duration,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'category_id': category_id,
      'video_url': video_url,
      'video_title': video_title,
      'video_duration': video_duration,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      category_id: map['category_id']?.toInt() ?? 0,
      video_url: map['video_url'] ?? '',
      video_title: map['video_title'] ?? '',
      video_duration: map['video_duration'] ?? '',
    );
  }


}
