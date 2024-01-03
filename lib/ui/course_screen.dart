import 'package:courses/apptheme.dart';
import 'package:courses/ui/grid_course_item.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

import '../variables/images.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return const GridCourseItems();
  }
}
