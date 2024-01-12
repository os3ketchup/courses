import 'package:courses/ui/course_content_item_sceen.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../apptheme.dart';
import '../language.dart';
import '../variables/icons.dart';

class CourseContent extends StatefulWidget {
  const CourseContent({super.key});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 12.o),
      child: Column(
        children: [
          for (final item in ["dasd", "dasdasd", "das","dasda"])
            _buildCourseContentItem(() {
              {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CourseContentItemScreen();
                  },
                ));
              };
            }, firstLesson.tr,6),
        ],
      ),
    );
  }

  Widget _buildCourseContentItem(Function() onTap, String lessonTitle,int amountLesson) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:12.o,vertical: 6.o),
        child: Container(
          decoration: BoxDecoration(
              color: theme.white,
              borderRadius: BorderRadius.all(Radius.circular(10.o))),
          padding: EdgeInsets.all(10.o),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(SVGImages.videoCam),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.o),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        lessonTitle,
                        style: theme.styleMontserratBlack.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '$amountLesson dars',
                        style: theme.styleMontserratBlack.copyWith(
                            fontSize: 11.o,
                            fontWeight: FontWeight.w500,
                            color: theme.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
