import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loyalty_project/main.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<dynamic> localStorage = MyApp.init();
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/sign-in'),
    );

    super.initState();
  }

  // Future<void> getPref() async {
  //   SharedPreferences prefs = await localStorage;
  //   print('splash => ' + prefs.get('token'));
  // }

  @override
  Widget build(BuildContext context) {
    //getPref();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        width: 200,
        height: 220,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/loyalty.jpeg'))),
      )),
    );
  }
}
