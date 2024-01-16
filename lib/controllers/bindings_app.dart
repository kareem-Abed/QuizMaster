import 'package:get/get.dart';
import 'package:QuizMaster/controllers/quiz_controller.dart';

class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
