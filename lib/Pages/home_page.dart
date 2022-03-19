import 'package:flutter/material.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:videostreaming/Logic/read_json.dart';
import 'package:videostreaming/Models/category_model.dart';
import 'package:videostreaming/Pages/videos_screen.dart';
import 'package:videostreaming/Widgets/category_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Programming Videos"),
        ),
        body: FutureBuilder(
          future: JSonReaderLogic().readJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List data = snapshot.data as List;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    children: List.generate(data.length, (index) {
                      CategoryModel categoryModel =
                          CategoryModel.fromMap(data[index]);
                      return CategoryCard(
                        categoryModel: categoryModel,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return VideosScreen(categoryModel: categoryModel);
                            },
                          ));
                        },
                      );
                    })),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                  8,
                  (index) => CardPageSkeleton(
                        totalLines: 2,
                      )),
            );
          },
        ));
  }
}
