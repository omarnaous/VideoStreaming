import 'package:flutter/material.dart';

import 'package:videostreaming/Models/category_model.dart';
import 'package:videostreaming/Widgets/custom_image.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.categoryModel,
    required this.onTap,
  }) : super(key: key);

  final CategoryModel categoryModel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Card(
                child: CustomNetworkImage(
                    imageWidth: 350, imageUrl: categoryModel.category_image),
              ),
            ),
          ),
          Text(
            categoryModel.category_name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
