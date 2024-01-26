import 'package:courses/ui/onboarding_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
          setState(() {
            _visible = false;
          });
      },
    );
    // Wait for 2 seconds then navigate to onboarding screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const OnboardingScreen();
        },
      ));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: AnimatedOpacity(
          opacity: _visible ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 1500),
          child: Center(
              child: Image.asset(
            PNGImages.sharkLogoLow,
          )),
        ),
      ),
    );
  }
}
