import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:QuizMaster/models/question.dart';
import 'package:QuizMaster/view/pages/answers.dart';

import '../../controllers/quiz_controller.dart';
import 'home.dart';

class QuizFinishedPage extends StatefulWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  QuizFinishedPage({Key? key, required this.questions, required this.answers})
      : super(key: key);

  @override
  _QuizFinishedPageState createState() => _QuizFinishedPageState();
}

class _QuizFinishedPageState extends State<QuizFinishedPage> {
  int? correctAnswers;

  @override
  Widget build(BuildContext context) {
    QuizController controller = Get.find<QuizController>();
    int correct = 0;
    this.widget.answers.forEach((index, value) {
      if (this.widget.questions[index].correctAnswer == value) correct++;
    });
    final TextStyle titleStyle = TextStyle(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 19.0,
        fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[

                SizedBox(height: 10.0),
                Container(

                  width: 365,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        width: 365,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        padding: EdgeInsets.all(15.0),
                        child:    Center(
                          child: Text(
                            'Result',
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),),
                      SizedBox(height: 20.0),
                  Container(

                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Column(
                        children: [
                          Text("Score", style: titleStyle),
                          Text(
                              "${correct / widget.questions.length * 100}%",
                              style: trailingStyle),
                        ],
                      ),
                    ],
                  ),
                  ),

                      SizedBox(height: 20.0),
                  Container(

                    decoration: BoxDecoration(
                     color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            children: [
                              Text("Correct Answers", style: TextStyle(
                                  color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w400)),
                              Text("$correct/${widget.questions.length}",
                                  style: trailingStyle),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 2,
                            color: Colors.white,),
                          Column(
                            children: [
                              Text("Incorrect Answers", style:  TextStyle(
                                  color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w400)),
                              Text(
                                  "${widget.questions.length - correct}/${widget.questions.length}",
                                  style: trailingStyle),
                            ],
                          ),
                        ],
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                    ElevatedButton(
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
                        "Home",
                        style: trailingStyle,
                      ),
                      onPressed: () {
                        int c = correct;
                        int q = widget.questions.length;
                        controller.addpoints(q, c);
                        Get.offAll(HomePage());
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
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
                        "Check Answers",
                        style: trailingStyle,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CheckAnswersPage(
                                  questions: widget.questions,
                                  answers: widget.answers,
                                )));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
