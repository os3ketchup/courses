import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged; // Callback function to pass the selected index

  const HomeBottomNavBar({
    required this.selectedIndex,
    required this.onIndexChanged,
    super.key,
  });

  @override
  _HomeBottomNavBarState createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  // Variable to track the selected index

  @override
  Widget build(BuildContext context) {

    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        height: 60.0, // Height of the bottom navigation bar
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.o),
            topRight: Radius.circular(10.o),
          ),
          color: Colors.white, // Background color of the "card"
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1.o), // Shadow color
              spreadRadius: 1.o,
              blurRadius: 4,
              offset: Offset(0.o, -0.1.o), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(SVGImages.home, basic.tr, 0),
            buildNavItem(SVGImages.ourCourses, ourCourses.tr, 1),
            buildNavItem(SVGImages.profile, profile.tr, 2),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {

          widget.onIndexChanged(index);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: 4.0.o,
            width: 50.0.o,
            decoration: BoxDecoration(
              color: widget.selectedIndex == index
                  ? Colors.blue
                  : Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.o),
                bottomRight: Radius.circular(5.o),
              ),
            ),
          ),
          SizedBox(height: 8.0.o),
          SvgPicture.asset(
            icon,
            color: widget.selectedIndex == index ? theme.blue : Colors.grey,
          ),
          SizedBox(height: 4.0.o),
          Text(
            label,
            style: theme.textStyleSimple.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12.0.o,
              color: widget.selectedIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
