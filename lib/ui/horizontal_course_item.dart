import 'package:courses/apptheme.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HorizontalCourseItems extends StatefulWidget {
  const HorizontalCourseItems({super.key});

  @override
  State<HorizontalCourseItems> createState() => _HorizontalCourseItemsState();
}

class _HorizontalCourseItemsState extends State<HorizontalCourseItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xffE9EEF7),
            borderRadius: BorderRadius.all(
              Radius.circular(10.o),
            ),
          ),
          width: 336.o,
          margin: EdgeInsets.all(8.o),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Container()),
                  Image.asset(
                    PNGImages.coursePngImage,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(12.o),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 336.o,
                        child: Text(
                          'Sotuvni o\'rganing',
                          textAlign: TextAlign.start,
                          style: theme.styleMontserratBlack.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 16.o),
                        )),
                    SizedBox(
                      width: 336.o,
                      child: Text(
                        'dsa q dqw dqw qwdqwdqwd qqwdqwdwdqwqwdqwqdqwd',
                        textAlign: TextAlign.left,
                        style: theme.textStyleSimple.copyWith(
                            fontSize: 11.o, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                        width: 336.o,
                        child:  Row(
                          children: [
                            Text('Bizning kurslar',style: theme.textStyleSimple.copyWith(color: theme.blue,fontWeight: FontWeight.w500),),
                            SvgPicture.asset(SVGImages.rightArrow),
                          ],
                        ))
                  ],
                ),
              ),
              // Expanded(child: Container()),
            ],
          ),
        );
      },
    );
  }
}
