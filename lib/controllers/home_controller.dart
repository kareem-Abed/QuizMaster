
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category.dart';
import '../view/widgets/options.dart';
class HomeController extends GetxController{


  Widget buildCategoryItem(BuildContext context, int index,_animationController) {
    Category category = categories[index];
    return GestureDetector(
      onTap: () => _categoryPressed(context, category,_animationController),
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

  _categoryPressed(BuildContext context, Category category,_animationController) {
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
              color: Colors.grey[900], // Set the background color as per your requirement
              // image: DecorationImage(
              //   image: NetworkImage(
              //     "https://c4.wallpaperflare.com/wallpaper/707/220/899/gradient-blue-pink-abstract-art-wallpaper-preview.jpg",
              //   ),
              //   fit: BoxFit.cover,
              // ),
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
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onClose() {

    super.onClose();
  }

}
