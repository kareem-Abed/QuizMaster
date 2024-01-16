import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:QuizMaster/view/pages/home.dart';
import 'package:QuizMaster/controllers/bindings_app.dart';
import 'dart:convert';

import 'view/pages/splash.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsApp(),
      title: 'Quiz Master',
      home: SplashScreen(),
    );
  }
}
