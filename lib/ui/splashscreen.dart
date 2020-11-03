import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant/ui/home_page.dart';

class Splashscreen extends StatefulWidget{
  static const routeName = '/splash_screen';
  @override
  _SplashscreenState createState() => _SplashscreenState();

}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.restaurant,
          size: 200,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}