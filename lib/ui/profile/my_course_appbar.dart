import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../apptheme.dart';

class MyCourseAppbar extends StatelessWidget {
  const MyCourseAppbar({required this.titleAppbar, super.key});

  final String titleAppbar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.o),
              bottomRight: Radius.circular(10.o))),
      child: Container(
        padding: EdgeInsets.only(top: 30.o),
        margin: EdgeInsets.only(bottom: 10.o),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(8.o),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.o)),
                    color: theme.bgCourse),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 10.o, left: 10.o, top: 8.o, bottom: 8.o),
                  child: SizedBox(child: SvgPicture.asset(SVGImages.backIcon)),
                )),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(right: 18.o),
              child: Text(
                titleAppbar,
                textAlign: TextAlign.center,
                style: theme.styleMontserratBlack
                    .copyWith(fontSize: 16.o, fontWeight: FontWeight.w600),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
