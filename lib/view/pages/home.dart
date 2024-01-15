import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/view/widgets/quiz_options.dart';

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
                            horizontal: 30.0, vertical: 10.0),
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
                          return _buildCategoryItem(context, index);
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

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return GestureDetector(
      onTap: () => _categoryPressed(context, category),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 20.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 200,
              height: (index == 0) ? 170 : 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // if (category.icon != null) Icon(category.icon,color: tileColors[0],size: 40,),
                  // if (category.icon != null) SizedBox(height: 5.0),
                  Image.asset(
                    category.image,
                    fit: BoxFit.fitWidth,
                    width: 120,
                    height: 120,
                  ),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      category.name,
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                      maxLines: 3,
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

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent, // Set the background color as per your requirement
              image: DecorationImage(
                image: NetworkImage(
                  "https://c4.wallpaperflare.com/wallpaper/707/220/899/gradient-blue-pink-abstract-art-wallpaper-preview.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BottomSheet(
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return QuizOptionsDialog(category: category);
              },
              onClosing: () {},
              enableDrag: true,
              showDragHandle: true,
              animationController: _animationController,
            ),
          ),
        ),
      ),
    );
  }
  //
  // _categoryPressed(BuildContext context, Category category) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (sheetContext) => BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20.0),
  //           topRight: Radius.circular(20.0),
  //         ),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               begin: Alignment.topCenter,
  //               end: Alignment.bottomLeft,
  //               colors: [
  //
  //                Colors.lightBlueAccent,
  //                 Colors.blueAccent,
  //                 Colors.lightBlueAccent,
  //
  //                 Color(0xFF0099FF), // Light Blue
  //                 Color(0xFF003366),// Darker Blue
  //                 Colors.blue,
  //               ],
  //             ),
  //           ),
  //           child: BottomSheet(
  //             backgroundColor: Colors.transparent,
  //             builder: (BuildContext context) {
  //               return QuizOptionsDialog(category: category);
  //             },
  //             onClosing: () {},
  //             enableDrag: true,
  //             showDragHandle: true,
  //             animationController: _animationController,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

// _categoryPressed(BuildContext context, Category category) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (sheetContext) => Container(
  //       decoration:  BoxDecoration(
  //        // color:Colors.grey[800],
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20.0),
  //           topRight: Radius.circular(20.0),
  //           bottomLeft: Radius.zero,
  //           bottomRight: Radius.zero,
  //         ),
  //         image: DecorationImage(
  //                     image: NetworkImage(
  //                       "https://c4.wallpaperflare.com/wallpaper/707/220/899/gradient-blue-pink-abstract-art-wallpaper-preview.jpg",
  //                     ),
  //                     fit: BoxFit.cover,
  //                   ),
  //       ),
  //       child: BottomSheet(
  //         backgroundColor: Colors.transparent,
  //         builder: (BuildContext context) {
  //           return QuizOptionsDialog(category: category);
  //         },
  //         onClosing: () {},
  //         enableDrag: true,
  //         showDragHandle: true,
  //         animationController: _animationController,
  //       ),
  //     ),
  //   );
  // }
}
