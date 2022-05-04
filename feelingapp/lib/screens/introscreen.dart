import 'dart:async';
import 'package:feelingapp/screens/homescreen.dart';
import 'package:feelingapp/utils/globalstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  GlobalStyle _globalStyle = new GlobalStyle();

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () => Get.to(() => const HomeScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _globalStyle.color1,
      body: Center(
        child: Text(
          "Feeling App by Qube Health",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
