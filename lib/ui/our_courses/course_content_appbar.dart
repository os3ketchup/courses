import 'package:courses/ui/our_courses/course_content_item_sceen.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../apptheme.dart';
import '../../language.dart';
import '../../variables/icons.dart';

class CourseContentAppbar extends StatefulWidget {
  CourseContentAppbar(
    this.selectedValue, {
    super.key,
    required this.toolbarName,
    required this.toolbarIcon,
    required this.contentList,
    required this.onTap,
  });

  final String toolbarName;
  final String toolbarIcon;
  final List<String> contentList;
  int selectedValue;
   Function(dynamic value) onTap;

  @override
  State<CourseContentAppbar> createState() => _CourseContentAppbarState();
}

class _CourseContentAppbarState extends State<CourseContentAppbar> {
  int selectedValue = 0;
  @override
  void initState() {
    selectedValue = widget.selectedValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Get the device's screen width
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.o),
          bottomLeft: Radius.circular(20.o),
        ),
        color: theme.white, // Background color of the "card"
      ),
      height: 140.o,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.o),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.o),
                    ),
                    color: const Color(0xffF4F7FD),
                  ),
                  margin: EdgeInsets.all(8.o),
                  padding: EdgeInsets.only(
                      right: 15.o, left: 15.o, top: 13, bottom: 13.o),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                        height: 10.o,
                        width: 6.o,
                        child: SvgPicture.asset(widget.toolbarIcon)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 38.o),
                    child: Text(
                      widget.toolbarName,
                      textAlign: TextAlign.center,
                      style: theme.styleMontserratBlack.copyWith(
                          fontSize: 18.o, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
                isExpanded: true,
                hint: Container(
                  decoration: BoxDecoration(
                      color: theme.bgCourse,
                      borderRadius: BorderRadius.all(Radius.circular(14.o))),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.o),
                        child: SvgPicture.asset(SVGImages.rightPlay),
                      ),
                      Expanded(
                          child: Text(
                        enter.tr,
                        style: theme.styleMontserratBlack.copyWith(
                            fontSize: 14.o,
                            fontWeight: FontWeight.w600,
                            color: theme.blue),
                      )),
                    ],
                  ),
                ),
                items: List.generate(widget.contentList.length, (index) => index)
                    .map((int item) => DropdownMenuItem<int>(
                          value: item,
                          child: Row(
                            children: [
                              SvgPicture.asset(SVGImages.lock),
                              Expanded(
                                  child: Text(widget.contentList[item],
                                      style: theme.textStyleSimple
                                          .copyWith(fontSize: 14.o),
                                      overflow: TextOverflow.ellipsis))
                            ],
                          ),
                        ))
                    .toList(),
                value:selectedValue,
                onChanged: (value){
                  selectedValue = value ?? 0;
                  widget.onTap(value);
                  setState(() {});
                },
                buttonStyleData: ButtonStyleData(
                  width: screenWidth * 0.95,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: theme.bgCourse,
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: SvgPicture.asset(SVGImages.down),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 100.o,
                  width: screenWidth * 0.95,
                  decoration: BoxDecoration(
                    color: theme.bgCourse,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                )),
          )
        ],
      ),
    );
  }
}
