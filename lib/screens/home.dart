// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/constants/app_const.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calcumator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10),
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10),
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightController.text);
                double w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = w / (h * h);
                  if (_bmiResult > 25) {
                    _textResult = "You're over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult > 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You are under weight";
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 32,
                    color: accentHexColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
