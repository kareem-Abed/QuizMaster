import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:QuizMaster/models/question.dart';

import 'home.dart';

class CheckAnswersPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const CheckAnswersPage(
      {Key? key, required this.questions, required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: 5.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.lightBlueAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: Colors.grey[800],
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.lightBlueAccent,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: questions.length,
                itemBuilder: _buildItem,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    Question question = questions[index];
    bool correct = question.correctAnswer == answers[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${index + 1}. ${HtmlUnescape().convert(question.question!)}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
              ),
              SizedBox(height: 15.0),
              Container(
                height: 80,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(14.0),
                ),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text("Your Answer: ",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w500)),
                    Text(
                      ' ${HtmlUnescape().convert("${answers[index]}") == 'null' ? "Not Answered" : HtmlUnescape().convert("${answers[index]}")}',
                      style: TextStyle(
                          color: correct ? Colors.green : Colors.redAccent,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 80,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(14.0),
                ),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text("Correct Answer: ",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w500)),
                    Text(HtmlUnescape().convert(question.correctAnswer!),
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
