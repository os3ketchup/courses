import 'package:courses/apptheme.dart';
import 'package:courses/ui/course_content_item_sceen.dart';
import 'package:courses/ui/my_course_appbar.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../language.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  List<String> list = ["dasda", "dasdasd", "dasdas"];

  @override
  Widget build(BuildContext context) {
    setState(() {
      list = list;
    });
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(94.o),
            child: MyCourseAppbar(
              titleAppbar: myCourses.tr,
            )),
        body: Container(
          color: theme.bgCourse,
          child: ListView(
            children: [
              list.isEmpty ? _buildEmptyScreen() : Container(),
              for (final items in list) _buildCourseItem((){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CourseContentItemScreen();
                },));
              })
            ],
          ),
        ));
  }

  Widget _buildCourseItem(void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.o),
        margin: EdgeInsets.all(8.o),
        decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.o,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
                width: 114.o,
                height: 89.o,
                child: Image.asset(
                  PNGImages.lessonRoom,
                  fit: BoxFit.cover,
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.o),
                    margin: EdgeInsets.only(left: 8.o),
                    width: 132.o,
                    child: Text(
                      'Anonim qo\'ng\'iroqlar',
                      textAlign: TextAlign.start,
                      style: theme.styleMontserratBlack.copyWith(
                          fontSize: 14.o, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(bottom: 2.o),
                    child: LinearPercentIndicator(
                      barRadius: Radius.circular(14.o),
                      lineHeight: 11.5,
                      percent: 0.4,
                      backgroundColor: const Color(0xffF4F7FD),
                      progressColor: theme.blue,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('10/25',style: theme.styleMontserratBlack.copyWith(fontWeight: FontWeight.w500,fontSize: 12.o),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyScreen() {
    return SizedBox(
      height: 700.o,
      width: 50.o,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SVGImages.rightPlay,
            height: 41.o,
            width: 41.o,
          ),
          Text(
            'Hozircha hech qanday\n izohlar topilmadi!',
            textAlign: TextAlign.center,
            style: theme.styleMontserratBlack.copyWith(
                fontSize: 14.o, fontWeight: FontWeight.w400, color: theme.grey),
          )
        ],
      ),
    );
  }
}
