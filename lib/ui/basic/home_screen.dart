import 'package:courses/ui/basic/vertical_course_item.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

import '../../apptheme.dart';
import 'horizontal_course_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  theme.bgCourse,
      child: ListView(
        children: [
          SizedBox(height: 150.o, child: const HorizontalCourseItems()),
          SizedBox(height: 520.o ,child: const VerticalCourseItems()),
        ],
      ),
    );
  }
}
