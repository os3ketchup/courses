import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseAdvantage extends StatefulWidget {
  const CourseAdvantage({super.key});

  @override
  State<CourseAdvantage> createState() => _CourseAdvantageState();
}

class _CourseAdvantageState extends State<CourseAdvantage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(left: 12.o,right: 12.o,top: 12.o),
          child: Row(
            children: [
              SvgPicture.asset(SVGImages.thumbsUp),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  advantages.tr,
                  style: theme.styleMontserratBlack
                      .copyWith(fontSize: 16.o, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        for (final item in ["dasd", "dasdsa", "dasdasd", "das"])
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.o,vertical: 6.o),
            child: Row(
              children: [
                SvgPicture.asset(SVGImages.done),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    easyAndGood.tr,
                    style: theme.styleMontserratBlack
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 14.o),
                  ),
                )
              ],
            ),
          ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.o,vertical: 6.o),
          child: Row(
            children: [
              SvgPicture.asset(SVGImages.lightning),
              Text(
                requirements.tr,
                style: theme.styleMontserratBlack
                    .copyWith(fontSize: 16.o, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        for (final item in ["dasd", "dasdsa", "dasdasd", "das"])
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.o,vertical: 6.o),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.o, color: theme.blue),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1",
                        style: theme.styleMontserratBlack.copyWith(
                            fontSize: 12.o, fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    easyAndGood.tr,
                    style: theme.styleMontserratBlack
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 14.o),
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
