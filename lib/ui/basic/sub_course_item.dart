import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

import '../../apptheme.dart';
import '../../variables/images.dart';

class SubHorizontalCourseItem extends StatefulWidget {
  const SubHorizontalCourseItem({super.key});

  @override
  State<SubHorizontalCourseItem> createState() => _SubHorizontalCourseItemState();
}

class _SubHorizontalCourseItemState extends State<SubHorizontalCourseItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.all(8.o),
        width: 336.o,
        height: 241.o,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(4.o),
              child: Text(
                'Eng ko\'p sotilyatganalar',
                style: theme.styleMontserratBlack
                    .copyWith(fontSize: 16.o, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 208.o,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(4.o),
                    decoration: BoxDecoration(
                      color: theme.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.o),
                      ),
                    ),
                    height: 208.o,
                    width: 170.o,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(PNGImages.lessonRoom),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.o),
                          child: Text(
                            'Anonim qo\'ng\'iroqlar',
                            style: theme.styleMontserratBlack.copyWith(
                                fontSize: 14.o,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.o),
                          child: Text(
                            '100 000 000 UZS',
                            style: theme.styleMontserratBlack.copyWith(
                                color: theme.blue,
                                fontSize: 12.o,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
