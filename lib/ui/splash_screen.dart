import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Wait for 2 seconds then navigate to onboarding screen
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.pushReplacementNamed(context, '/onboarding');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
            child: SvgPicture.asset(
              'assets/icons/shark_logo.svg',
              width: 400.o,
              height: 400.o,
            )),
      ),
    );
  }
}
