import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timer_controller/timer_controller.dart';
import '../models/category.dart';
import '../models/question.dart';
import '../view/pages/quiz_finished.dart';

class QuizController extends GetxController{


  int rank = 20;



 //question variables
  int duration = 20;

   late  TimerController timerController;

  int currentIndex = 0;

   List<Question> questions= [];
  final Map<int, dynamic> answers = {};
  List<dynamic> options = [];

  double points = GetStorage().read('points') ?? 0.0;


// Store the double value





 void addpoints(int questionsLength,int correct) async {

   if(correct!=0) points+= (correct/questionsLength);
   GetStorage().write('points', points);
    update();
  }

   questionUpdate() async {
    Question question= questions[currentIndex];
     options = question.incorrectAnswers!;
    if (!options.contains(question.correctAnswer)) {
    options.add(question.correctAnswer);
    options.shuffle();
    }
  }

  String baseUrl = "https://opentdb.com/api.php";
  Future<List<Question>> getQuestions(Category category, int? total, String? difficulty) async {
    String url = "$baseUrl?amount=$total&category=${category.id}";
    if(difficulty != null) {
      url = "$url&difficulty=$difficulty";
    }

    http.Response res = await http.get(Uri.parse(url));
    List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);
    currentIndex=0;
    update();
    return Question.fromData(questions);
  }

  // //Fich Questions
  // Future<List<Question>> getQuestions(Category category, int? total, String? difficulty) async {
  //   String url = "$baseUrl?amount=$total&category=${category.id}";
  //   if(difficulty != null) {
  //     url = "$url&difficulty=$difficulty";
  //   }
  //
  //   http.Response res = await http.get(Uri.parse(url));
  //   List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);
  //   currentIndex=0;
  //   update();
  //   return Question.fromData(questions);
  // }

  void nextSubmit(context,questions) {
    // if (answers[currentIndex] == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text("You must select an answer to continue."),
    //   ));
    //   return;
    // }
    if (currentIndex < (questions.length - 1)) {

       currentIndex++;
        update();
       timerController.restart();

    } else {
     // Get.replace(QuizFinishedPage(questions: questions, answers: answers));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => QuizFinishedPage(questions:questions, answers: answers)));
    }
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
