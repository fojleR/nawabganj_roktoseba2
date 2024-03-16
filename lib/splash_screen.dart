import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './log_in.dart';
import './ReadyDonor/readyDonor.dart';
import './important_numbers/important.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[800],
        child: Center(
          child: ClipOval(
            child: Image.asset(
              "lib/assets/photos/splash_design.png",
              height: 200,
              // height: 100,
            ),
          ),
        )

      ),
    );
  }
}
