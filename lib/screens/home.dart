// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/widgets/dimensions.dart';
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
    //hei - 825,wid-392
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calcumator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        elevation: 10,
        centerTitle: true,
      ),
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: Dimensions.height140,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10),
                  width: Dimensions.width150,
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: Dimensions.font42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height(m)",
                          hintStyle: TextStyle(
                              fontSize: Dimensions.font30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  ),
                ),
                Container(
                  height: Dimensions.height140,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10),
                  width: Dimensions.width150,
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: Dimensions.font42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight(kg)",
                          hintStyle: TextStyle(
                              fontSize: Dimensions.font30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
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
                margin: EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.of(context).size.width,
                height: Dimensions.height50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: Colors.redAccent[700]),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: Dimensions.font30 * 1.3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height50,
            ),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: Dimensions.font30 * 3, color: Colors.white),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: Dimensions.font30,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: Dimensions.height20 / 2,
            ),
            LeftBar(barWidth: Dimensions.width40),
            SizedBox(
              height: Dimensions.height20,
            ),
            LeftBar(barWidth: Dimensions.width70),
            SizedBox(
              height: Dimensions.height20,
            ),
            LeftBar(barWidth: Dimensions.width40),
            SizedBox(
              height: Dimensions.height20,
            ),
            RightBar(barWidth: Dimensions.width70),
            SizedBox(
              height: Dimensions.height50,
            ),
            RightBar(barWidth: Dimensions.width70),
          ],
        ),
      ),
    );
  }
}
