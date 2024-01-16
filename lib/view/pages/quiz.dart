
import 'package:QuizMaster/view/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:QuizMaster/models/category.dart';
import 'package:QuizMaster/view/pages/finished.dart';
import 'package:html_unescape/html_unescape.dart';
import '../../controllers/quiz_controller.dart';
import 'package:timer_controller/timer_controller.dart';
import 'package:circular_countdown/circular_countdown.dart';

class QuizPage extends StatefulWidget {

  final Category? category;
  String noOfQuestions = "10";
  QuizPage(
      {Key? key,

      this.category,
      required this.noOfQuestions})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  Color backgroundColor = Color(0xFF323232);

  QuizController controller = Get.find<QuizController>();
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);



  @override
  void initState() {
    super.initState();
    controller.timerController = TimerController.seconds(40);
    controller.timerController.start();
  }

  @override
  void dispose() {
   controller.timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.questionUpdate();

    // Question question = widget.questions[controller.currentIndex];
    // final List<dynamic> options = question.incorrectAnswers!;
    // if (!options.contains(question.correctAnswer)) {
    //   options.add(question.correctAnswer);
    //   options.shuffle();
    // }
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: GetBuilder<QuizController>(
            builder: (controller) => Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    //app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.quit(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 2.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 18.0,
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                FontAwesomeIcons.times,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 2.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Container(
                                width: 250,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(50.0),
                                  minHeight: 8.0,
                                  value: (controller.currentIndex + 1) /
                                      controller.questions.length,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                ),
                              ),
                              Text(
                                '${controller.currentIndex + 1} /${widget.noOfQuestions}',
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10.0),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.0),
                      ],
                    ),
                    SizedBox(height: 20.0),

                    //question
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: <Widget>[
                        Container(
                          height: 240,
                          width: 390,
                        ),
                        Positioned(
                          top: 25,
                          child: Container(
                            height: 210,
                            width: 365,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.all(35.0),
                            child: Text(
                              HtmlUnescape().convert(controller
                                  .questions[controller.currentIndex]
                                  .question!),
                              softWrap: true,
                              style: _questionStyle,
                            ),
                          ),
                        ),
                        Positioned(
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.black,
                            child: TimerControllerListener(
                              controller: controller.timerController,
                              listenWhen: (previousValue, currentValue) =>
                                  previousValue.status != currentValue.status,
                              listener: (context, timerValue) {
                                if (timerValue.status == TimerStatus.finished) {
                                  controller.nextSubmit(
                                      context, controller.questions);
                                  controller.questionUpdate();
                                }
                                controller.timerController.restart();
                              },
                              child: TimerControllerBuilder(
                                controller: controller.timerController,
                                builder: (context, timerValue, _) {
                                  return CircularCountdown(
                                    isClockwise: false,
                                    diameter: 55,
                                    countdownTotal:
                                    controller.timerController.initialValue.remaining,
                                    countdownRemaining: timerValue.remaining,
                                    countdownCurrentColor: Colors.red,
                                    countdownRemainingColor:
                                        Colors.lightBlueAccent,
                                    //   countdownTotalColor: Colors.black,
                                    strokeWidth: 10,
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.0),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.options.length,
                            itemBuilder: (context, index) {
                              final option = controller.options[index];

                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5),
                                    child: Card(
                                      color: Colors.grey[800],
                                      child: RadioListTile(
                                        fillColor: MaterialStateProperty.all(
                                            Colors.lightBlueAccent),
                                        //overlayColor: MaterialStateProperty.all(Colors.white),

                                        tileColor:
                                            Colors.black.withOpacity(0.1),

                                        title: Text(
                                          HtmlUnescape().convert("$option"),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        groupValue: controller.answers[controller.currentIndex],
                                        value: option,
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            controller.answers[controller.currentIndex] = option;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent,
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  )),
                              child: Text(
                                controller.currentIndex ==
                                        (controller.questions.length - 1)
                                    ? "Submit"
                                    : "Next",
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              ),
                              onPressed: () {
                                controller.nextSubmit(context, controller.questions);
                                controller.questionUpdate();
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
      ),
    );
  }


}

