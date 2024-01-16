import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timer_controller/timer_controller.dart';
import '../models/category.dart';
import '../models/question.dart';
import '../view/pages/finished.dart';
import '../view/pages/home.dart';

class QuizController extends GetxController {
  int rank = 234;

  //question variables
  int duration = 20;

  late TimerController timerController;

  int currentIndex = 0;

  List<Question> questions = [];
  final Map<int, dynamic> answers = {};
  List<dynamic> options = [];

  double points = GetStorage().read('points') ?? 0.0;

// Store the double value

  void addpoints(int questionsLength, int correct) async {
    if (correct != 0) points += (correct / questionsLength);
    GetStorage().write('points', points);
    update();
  }

  questionUpdate() async {
    Question question = questions[currentIndex];
    options = question.incorrectAnswers!;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }
  }

  String baseUrl = "https://opentdb.com/api.php";
  Future<List<Question>> getQuestions(
      Category category, int? total, String? difficulty) async {
    String url = "$baseUrl?amount=$total&category=${category.id}";
    if (difficulty != null) {
      url = "$url&difficulty=$difficulty";
    }

    http.Response res = await http.get(Uri.parse(url));
    List<Map<String, dynamic>> questions =
        List<Map<String, dynamic>>.from(json.decode(res.body)["results"]);
    currentIndex = 0;
    update();
    return Question.fromData(questions);
  }

  void nextSubmit(context, questions) {
    if (currentIndex < (questions.length - 1)) {
      currentIndex++;
      update();
      timerController.restart();
    } else {
      Get.off(QuizFinishedPage(questions: questions, answers: answers));

      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => QuizFinishedPage(questions:questions, answers: answers)));
    }
  }

  quit(context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.grey[800],
            title:  const Text(
              'Are you sure?',
              style: TextStyle(color: Colors.white),
            ),
            content:  const Text(
              'Do you want to quit the quiz?',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
               TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child:  const Text(
                  'No',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
               TextButton(
                onPressed: () => Get.offAll(HomePage()),
                child:  const Text(
                  'Yes',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
