import 'package:courses/ui/about_course_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

import '../apptheme.dart';
import '../variables/images.dart';

class GridCourseItems extends StatefulWidget {
  const GridCourseItems({super.key});

  @override
  State<GridCourseItems> createState() => _GridCourseItemsState();
}

class _GridCourseItemsState extends State<GridCourseItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: theme.bgCourse,
      child: Container(
        margin: EdgeInsets.all(12.o),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 208.o,
              maxCrossAxisExtent: 170.o,
              crossAxisSpacing: 12.o,
              mainAxisSpacing: 12.o),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const AboutCourseScreen();
                  },
                ));
              },
              child: Container(
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
                            fontSize: 14.o, fontWeight: FontWeight.w500),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
