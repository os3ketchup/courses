import 'package:courses/language.dart';
import 'package:courses/ui/course_screen.dart';
import 'package:courses/ui/bottom_navigation.dart';
import 'package:courses/ui/home_appbar.dart';
import 'package:courses/ui/profile_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: changeToolbarParams(_selectedIndex),
      ),
      body: navigateToScreen(_selectedIndex),
      bottomNavigationBar: HomeBottomNavBar(
          selectedIndex: _selectedIndex,
          onIndexChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }

  Widget navigateToScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CourseScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const HomeScreen();

      // Handle other cases or show an error message
    }
  }

  Widget changeToolbarParams(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return AppBarContainer(Container(),
            toolbarName: basic.tr, toolbarIcon: SVGImages.home);
      case 1:
        return AppBarContainer(Container(
            margin: EdgeInsets.only(right: 16.o),
            child: SvgPicture.asset(SVGImages.filter)),
            toolbarName: ourCourses.tr, toolbarIcon: SVGImages.ourCoursesBlue);
      case 2:
        return Container(height: 0.o,);
      default:
        return const HomeScreen();

      // Handle other cases or show an error message
    }
  }
}
