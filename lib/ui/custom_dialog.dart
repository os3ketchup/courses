import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../apptheme.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 258.o,
        width: 325.o,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(SVGImages.close)),
            ),
            Container(
                padding: EdgeInsets.all(20.o),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: theme.btnBGColor),
                child: SvgPicture.asset(SVGImages.doubleDone)),
            const Spacer(),
            const Text(
              'Kursni muvaffaqiyatli\nsotib oldingiz!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
              width: 289.o,
              height: 44.o,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.o)),
                  color: theme.blue),
              child: TextButton(
                onPressed: () {
                  // enter to system
                },
                child: Text(
                  enteringSystem.tr,
                  style: theme.styleMontserratBlack.copyWith(
                      color: theme.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.o),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
