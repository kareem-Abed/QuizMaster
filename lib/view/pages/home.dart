import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:QuizMaster/models/category.dart';

import '../../controllers/home_controller.dart';
import '../../controllers/quiz_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1600,
      ),
    );

    _animationController.forward();
  }
  QuizController controller = Get.find<QuizController>();
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' QuizMaster',
                        style: const TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 80,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/icons/ranke.png'),
                          fit: BoxFit.fitHeight,
                          width: 80.0,
                          height: 80.0,
                        ),
                         Column(
                          children: [
                            Text('Ranking',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight:FontWeight.bold ),),
                            Text('${controller.rank}',style: TextStyle(fontSize: 20,color: Colors.lightBlueAccent,fontWeight:FontWeight.bold ),),
                          ],
                        ),
                        SizedBox(width: 10,),
                        const VerticalDivider(
                          color: Colors.white,
                          thickness: 1.0,
                        ),
                        const Image(
                          image: AssetImage('assets/icons/coin.png'),
                          width: 80.0,
                          height: 80.0,
                        ),
                         Column(
                          children: [
                            Text('Points',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight:FontWeight.bold ),),
                            Text('${controller.points.toStringAsFixed(2)}',style: TextStyle(fontSize: 20,color: Colors.lightBlueAccent,fontWeight:FontWeight.bold ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 11.0),
                        child: Text(
                          "Let's Play",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25.0),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MasonryGridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return homeController.buildCategoryItem(context, index,_animationController);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
