import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/sub_course_item.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';

class VerticalCourseItems extends StatefulWidget {
  const VerticalCourseItems({super.key});

  @override
  State<VerticalCourseItems> createState() => _VerticalCourseItemsState();
}

class _VerticalCourseItemsState extends State<VerticalCourseItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return const SubHorizontalCourseItem();
      },
    );
  }
}
