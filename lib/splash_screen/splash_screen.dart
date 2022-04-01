import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:invis_project/homepage/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  gotoHome() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAll(() => MyHomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    gotoHome();
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/pray.png"),
                  fit: BoxFit.fill,
                ))),
            Center(
              child: SizedBox(
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25.0, color: Colors.white60),
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText('Thank you for giving '),
                    TyperAnimatedText(' me this  opportunity'),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
