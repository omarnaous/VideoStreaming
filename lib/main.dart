import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:videostreaming/Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          cardTheme: CardTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
          )),
      home: EasySplashScreen(
        logo: Image.asset(
          "Assets/youtube.png",
        ),
        backgroundColor: Colors.white,
        logoSize: 400,
        showLoader: true,
        loaderColor: Colors.red,
        navigator: const MyHomePage(),
        durationInSeconds: 3,
      ),
    );
  }
}
