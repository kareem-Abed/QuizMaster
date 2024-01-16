import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:QuizMaster/models/category.dart';

import 'package:QuizMaster/view/pages/error.dart';
import 'package:QuizMaster/view/pages/quiz.dart';
import '../../controllers/quiz_controller.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category? category;

  const QuizOptionsDialog({Key? key, this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  final controller = Get.put(QuizController());
  String? _noOfQuestions;
  String? _difficulty;

  late bool processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = "10";
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
                style: const TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "Select Number of Questions and Difficulty",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: <String>['Random', 'Easy', 'Medium', 'Hard']
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: _difficulty,
                  onChanged: (String? newValue) {
                    setState(() {
                      _difficulty = newValue!;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.lightBlueAccent.withOpacity(0.6),
                      ),
                      color: Colors.grey.shade800.withOpacity(0.8),
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 20,
                    iconEnabledColor: Colors.lightBlueAccent,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Colors.lightBlueAccent.withOpacity(0.9),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color:Colors.grey.shade800.withOpacity(0.8),
                    ),
                    offset: const Offset(0, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(4),
                      thickness: MaterialStateProperty.all<double>(1),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: <String>['10', '20', '30', '40', '50']
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: _noOfQuestions,
                  onChanged: (String? newValue) {
                    setState(() {
                      _noOfQuestions = newValue!;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.lightBlueAccent.withOpacity(0.6),
                      ),
                      color: Colors.grey.shade800.withOpacity(0.8),
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 20,
                    iconEnabledColor: Colors.lightBlueAccent,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Colors.lightBlueAccent.withOpacity(0.9),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color:Colors.grey.shade800.withOpacity(0.8),
                    ),
                    offset: const Offset(0, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(4),
                      thickness: MaterialStateProperty.all<double>(1),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 90.0),
          if (processing) const CircularProgressIndicator(color: Colors.lightBlueAccent,) else Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.lightBlueAccent)
                    ),
                    backgroundColor: Colors.grey[800],
                  ),
                  onPressed:_startQuiz,
                  child: const Center(
                    child:Text(
                      "      Play      ",
                      style:TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,
                          letterSpacing: 2.0,

                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 50.0)
        ],
      ),
    );
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });
    try {
      String? difficulty = _difficulty!.toLowerCase();

      if (difficulty == "random") {
        difficulty = null;
      }
      //controller.getQuestions(widget.category!, _noOfQuestions, difficulty);
      controller.questions.clear();
      int noOfQuestions = int.parse(_noOfQuestions!);
      controller.questions = await controller.getQuestions(
          widget.category!, noOfQuestions, difficulty);
      Navigator.pop(context);
      if (controller.questions.length < 1) {
        Get.to(const ErrorPage(
          message:
          "The chosen options do not match the available questions in this category."

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
      Get.replace(const ErrorPage(
        message:
        "Unable to connect to servers. Please verify your internet connection."
      ));
    } catch (e) {
      print(e.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => const ErrorPage(
                    message: "An unforeseen error occurred while attempting to connect to the API.",
                  )));
    }
    setState(() {
      processing = false;
    });
  }
}
