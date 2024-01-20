import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/basic/grid_course_item.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../variables/icons.dart';
import '../../variables/images.dart';
import '../basic/home_appbar.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({required this.index, super.key});

  final int index;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.index;
    });
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(widget.index == 0 ? kToolbarHeight : 0.o),
          child: widget.index == 0
              ? AppBarContainer(
                  Container(
                      margin: EdgeInsets.only(right: 16.o),
                      child: SvgPicture.asset(SVGImages.filter)),
                  toolbarName: ourCourses.tr,
                  toolbarIcon: SVGImages.ourCoursesBlue)
              : Container()),
      body: const GridCourseItems(),
    );
  }
}
