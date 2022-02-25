import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

class SplashPage extends StatefulWidget {
  // const SplashPage({Key? key}) : super(key: key);
  static String routeName = "/splash_zero";
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        'assets/images/splash4.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
