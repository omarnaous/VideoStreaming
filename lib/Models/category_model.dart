// ignore_for_file: non_constant_identifier_names
class CategoryModel {
  final int category_id;
  final String category_name;
  final String category_image;
  final List videos;
  CategoryModel({
    required this.category_id,
    required this.category_name,
    required this.category_image,
    required this.videos,
  });

  Map<String, dynamic> toMap() {
    return {
      'category_id': category_id,
      'category_name': category_name,
      'category_image': category_image,
      'videos': videos,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category_id: map['category_id']?.toInt() ?? 0,
      category_name: map['category_name'] ?? '',
      category_image: map['category_image'] ?? '',
      videos: map["videos"] ?? [],
    );
  }

  
}
