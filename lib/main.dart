import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/view/pages/home.dart';
import 'package:quiz_app/controllers/bindings_app.dart';
import 'dart:convert';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsApp(),
      title: 'Quiz App',
      home: HomePage(),
    );
  }
}
