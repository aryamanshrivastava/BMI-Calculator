// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bmi_calculator/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../widgets/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 0,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Cal.png"), fit: BoxFit.cover)),
        ),
      ),
      Positioned(
        left: Dimensions.height140 / 1.14,
        top: Dimensions.height140 * 2.3,
        child: DefaultTextStyle(
          style: TextStyle(
              color: Colors.greenAccent,
              fontSize: Dimensions.font42 * 2,
              fontWeight: FontWeight.bold),
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TyperAnimatedText('BMI.',
                  textAlign: TextAlign.center, speed: Duration(seconds: 1)),
            ],
          ),
        ),
      ),
    ]);
  }
}
