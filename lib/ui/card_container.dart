import 'package:courses/util_variables.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 109.o,
      height: 70.o,
      child: Image.asset(PNGImages.clickImage),
    );
  }
}
