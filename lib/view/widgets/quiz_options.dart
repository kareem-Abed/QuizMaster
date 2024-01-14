import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:quiz_app/models/category.dart';

import 'package:quiz_app/view/pages/error.dart';
import 'package:quiz_app/view/pages/quiz_page.dart';
import '../../controllers/quiz_controller.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category? category;

  const QuizOptionsDialog({Key? key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  final controller = Get.put(QuizController());
  int? _noOfQuestions;
  String? _difficulty;
  late bool processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "Easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                widget.category!.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Select Total Number of Questions",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Container(

            height: 50,

            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(width: 15,),
                numberOfQuestions(10),
                SizedBox(width: 15,),
                numberOfQuestions(20),
                SizedBox(width: 15,),
                numberOfQuestions(30),
                SizedBox(width: 15,),
                numberOfQuestions(40),
                SizedBox(width: 15,),
                numberOfQuestions(50),
                SizedBox(width: 15,),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "Select Difficulty",
            style: TextStyle(color: Colors.white),
          ),
          Container(

            height: 50,

            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(width: 15,),
                difficulty("Random"),
                SizedBox(width: 15,),
                difficulty("Easy"),
                SizedBox(width: 15,),
                difficulty("Medium"),
                SizedBox(width: 15,),
                difficulty("Hard"),
                SizedBox(width: 15,),
              ],
            ),
          ),

          SizedBox(height: 20.0),
          processing
              ? CircularProgressIndicator()
              : GestureDetector(
                  child: GlassmorphicContainer(
                    width: 200,
                    height: 50,
                    borderRadius: 10,
                    blur: 5,
                    alignment: Alignment.bottomCenter,
                    border: 2.5,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.2),
                           Colors.black.withOpacity(0.2),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                    child: Center(
                        child: Text(
                          "      Start      ",
                          style: TextStyle(
                              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                  onTap: _startQuiz,
                ),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }

  GestureDetector numberOfQuestions(int numberOfQuestions) {
    return GestureDetector(
      onTap: () => _selectNumberOfQuestions(numberOfQuestions),
      child: GlassmorphicContainer(
        width: 60,
        height: 50,
        borderRadius: 10,
        blur: 5,
        alignment: Alignment.bottomCenter,
        border: 2.5,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              (_noOfQuestions != numberOfQuestions)
                  ? Color(0xFF000000).withOpacity(0.1)
                  : Colors.white.withOpacity(0.1),
              (_noOfQuestions != numberOfQuestions)
                  ? Color(0xFF000000).withOpacity(0.1)
                  : Colors.white.withOpacity(0.5),
            ],
            stops: [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.black.withOpacity(0.5),
          ],
        ),
        child: Center(
            child: Text(
          "$numberOfQuestions",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  GestureDetector difficulty(String difficulty) {
    return GestureDetector(
      onTap: () => _selectDifficulty(difficulty),
      child: GlassmorphicContainer(
        width: 100,
        height: 50,
        borderRadius: 10,
        blur: 5,
        alignment: Alignment.bottomCenter,
        border: 2.5,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              (_difficulty != difficulty)
                  ? Color(0xFF000000).withOpacity(0.1)
                  : Colors.white.withOpacity(0.1),
              (_difficulty != difficulty)
                  ? Color(0xFF000000).withOpacity(0.1)
                  : Colors.white.withOpacity(0.5),
            ],
            stops: [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.black.withOpacity(0.5),
          ],
        ),
        child: Center(
            child: Text(
          "$difficulty",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  _selectDifficulty(String? s) {
    setState(() {
      _difficulty = s;
    });
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });
    try {
      String? difficulty=_difficulty!.toLowerCase();

      if (difficulty == "random") {
        difficulty = null;
      }
      //controller.getQuestions(widget.category!, _noOfQuestions, difficulty);
      controller.questions = await controller.getQuestions(
          widget.category!, _noOfQuestions, difficulty);
      Navigator.pop(context);
      if (controller.questions.length < 1) {
        Get.to(ErrorPage(
          message:
          "There are not enough questions in the category, with the options you selected.",
        ));

        return;
      }
      Get.to(QuizPage(
      //  questions: questions,
        category: widget.category,
        noOfQuestions: '$_noOfQuestions',
      ));

    } on SocketException catch (_) {
      print(_.toString());
      Get.replace(ErrorPage(
        message:
        "Can't reach the servers, \n Please check your internet connection.",
      ));
    } catch (e) {
      print(e.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => ErrorPage(
                    message: "Unexpected error trying to connect to the API",
                  )));
    }
    setState(() {
      processing = false;
    });
  }
}
