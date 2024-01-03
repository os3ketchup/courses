import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/home_appbar.dart';
import 'package:courses/ui/pinput.dart';
import 'package:courses/ui/register_appbar.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(164.o),
          child: RegisterAppbar(
              toolbarName: register.tr, toolbarIcon: SVGImages.backIcon)),
      body: Container(
        padding: EdgeInsets.all(12.o),
        color: theme.bgCourse,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(enterCode.tr),
                  const RegisterPinPut(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.o),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.o))),
                      backgroundColor: theme.blue),
                  onPressed: () {},
                  child: Text(
                    enteringSystem.tr,
                    style: theme.styleMontserratBlack.copyWith(
                        color: theme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.o),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
