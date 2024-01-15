import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Select Number of Questions and Difficulty",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),


          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:  Colors.white,
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  elevation: 2,
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  width: 150,
                  decoration: BoxDecoration
                    ( border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.2),
                  ),

                  offset: Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: Radius.circular(4),
                    thickness: MaterialStateProperty.all<double>(1),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:  Colors.white,
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  elevation: 2,
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  width: 150,
                  decoration: BoxDecoration
                    ( border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.2),
                  ),

                  offset: Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: Radius.circular(4),
                    thickness: MaterialStateProperty.all<double>(1),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ],),

          SizedBox(height: 80.0),

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
          SizedBox(height: 600.0)
        ],
      ),
    );
  }

  // GestureDetector numberOfQuestions(int numberOfQuestions) {
  //   return GestureDetector(
  //     onTap: () => _selectNumberOfQuestions(numberOfQuestions),
  //     child: GlassmorphicContainer(
  //       width: 60,
  //       height: 50,
  //       borderRadius: 10,
  //       blur: 5,
  //       alignment: Alignment.bottomCenter,
  //       border: 2.5,
  //       linearGradient: LinearGradient(
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //           colors: [
  //             (_noOfQuestions != numberOfQuestions)
  //                 ? Color(0xFF000000).withOpacity(0.1)
  //                 : Colors.white.withOpacity(0.1),
  //             (_noOfQuestions != numberOfQuestions)
  //                 ? Color(0xFF000000).withOpacity(0.1)
  //                 : Colors.white.withOpacity(0.5),
  //           ],
  //           stops: [
  //             0.1,
  //             1,
  //           ]),
  //       borderGradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         colors: [
  //           Colors.white.withOpacity(0.5),
  //           Colors.black.withOpacity(0.5),
  //         ],
  //       ),
  //       child: Center(
  //           child: Text(
  //         "$numberOfQuestions",
  //         style: TextStyle(
  //             color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
  //       )),
  //     ),
  //   );
  // }
  //
  // GestureDetector difficulty(String difficulty) {
  //   return GestureDetector(
  //     onTap: () => _selectDifficulty(difficulty),
  //     child: GlassmorphicContainer(
  //       width: 100,
  //       height: 50,
  //       borderRadius: 10,
  //       blur: 5,
  //       alignment: Alignment.bottomCenter,
  //       border: 2.5,
  //       linearGradient: LinearGradient(
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //           colors: [
  //             (_difficulty != difficulty)
  //                 ? Color(0xFF000000).withOpacity(0.1)
  //                 : Colors.white.withOpacity(0.1),
  //             (_difficulty != difficulty)
  //                 ? Color(0xFF000000).withOpacity(0.1)
  //                 : Colors.white.withOpacity(0.5),
  //           ],
  //           stops: [
  //             0.1,
  //             1,
  //           ]),
  //       borderGradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         colors: [
  //           Colors.white.withOpacity(0.5),
  //           Colors.black.withOpacity(0.5),
  //         ],
  //       ),
  //       child: Center(
  //           child: Text(
  //         "$difficulty",
  //         style: TextStyle(
  //             color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
  //       )),
  //     ),
  //   );
  // }



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
      controller.questions .clear();
      int noOfQuestions= int.parse(_noOfQuestions!);
      controller.questions = await controller.getQuestions(
          widget.category!, noOfQuestions, difficulty);
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
