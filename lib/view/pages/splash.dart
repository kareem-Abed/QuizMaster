import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1.0;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(seconds: 1,microseconds: 200000),
          curve: Curves.easeInOut, // Use a smoother easing curve
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[900],
                    border: Border.all(color:Colors.lightBlueAccent ,width: 2 ),

                ),
                child: ClipRRect(
                  child: Image.asset(
                    "assets/icons/quiz.png",
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
              ),
           SizedBox(height: 15,),
              Text(
                "    QuizMaster    ",
                style: GoogleFonts.inter(
                  color:   Colors.lightBlueAccent,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),

              ),
              SizedBox(height: 10,),
               Text(
                "By kareem Ahmed",
                style: GoogleFonts.inter(
                   color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w300,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash.jpeg', // Replace with your image path
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}

