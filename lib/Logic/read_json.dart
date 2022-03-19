import 'dart:convert';

import 'package:flutter/services.dart';

class JSonReaderLogic{
  Future<List> readJson() async {
    final String response =
        await rootBundle.loadString('Assets/video_data.json');
    await Future.delayed(const Duration(seconds: 2), () {});
    final data = await json.decode(response);
    return data;
  }
}