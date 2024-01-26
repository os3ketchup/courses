import 'package:courses/apptheme.dart';
import 'package:courses/ui/our_courses/comments_content.dart';
import 'package:courses/ui/our_courses/course_content_appbar.dart';
import 'package:courses/ui/our_courses/description_content.dart';
import 'package:courses/ui/our_courses/entering_sys_bottom_sheet.dart';
import 'package:courses/ui/register/entering_phone_screen.dart';
import 'package:courses/ui/register/register_screen.dart';
import 'package:courses/ui/register/sign_up_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../language.dart';
import '../../variables/icons.dart';
import '../quiz/test_screen.dart';

class CourseContentItemScreen extends StatefulWidget {
  const CourseContentItemScreen({super.key});

  @override
  State<CourseContentItemScreen> createState() =>
      _CourseContentItemScreenState();
}

class _CourseContentItemScreenState extends State<CourseContentItemScreen> {
  List<bool> isClicked = [true, false];
  var obscureRepeatPassword = true;

  late List<String> items;
  int? selectedValue = 0;

  @override
  void initState() {
    items = List<String>.generate(10, (index) => 'Item$index');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery
        .of(context)
        .viewInsets
        .bottom - 80.o;
    if (bottom < 0) {
      bottom = 0;
    }

    bottom = MediaQuery
        .of(context)
        .viewInsets
        .bottom;
    return Scaffold(
      backgroundColor: theme.bgCourse,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(144.o),
        child: CourseContentAppbar(
          0,
          contentList: items,
          toolbarName: courseThemes.tr,
          toolbarIcon: SVGImages.backIcon,
          onTap: (value) {
            print('$value clicked');
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
      body: items[selectedValue!] != 'Item3'
          ? Container(
        margin: EdgeInsets.all(12.o),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _getCourseContainer(),
              _buildChoosingButton(),
              isClicked[0]
                  ? const DescriptionContent()
                  : const CommentsContent(),
            ],
          ),
        ),
      )
          : const TestScreen(),
      floatingActionButton: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: isClicked[0]
              ? _buildPassingContainer()
              : _buildCommentTextField()),
    );
  }

  Widget _buildChoosingButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.o),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14.o),
        ),
        color: const Color(0xffE5EBFB),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isClicked[0] = true;
                  isClicked[1] = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.o)),
                  color: isClicked[0] ? theme.blue : const Color(0xffE5EBFB),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description.tr,
                    style: theme.styleMontserratBlack.copyWith(
                        color: isClicked[0]
                            ? theme.white
                            : theme.styleMontserratBlack.color),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isClicked[0] = false;
                  isClicked[1] = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.o)),
                  color: isClicked[1] ? theme.blue : const Color(0xffE5EBFB),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    comments.tr,
                    style: theme.styleMontserratBlack.copyWith(
                        color: isClicked[1]
                            ? theme.white
                            : theme.styleMontserratBlack.color),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void showBottomDialog(Widget dialog, BuildContext context) =>
      showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.o),
            topRight: Radius.circular(30.o),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: theme.card,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        },
      );

  Widget _getCourseContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.o),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(isScrollControlled: true,context: context, builder: (context)
              {
                return const EnteringSystemBottomSheet();
              },);
            },
            child: Image.asset(
              PNGImages.playLessonRoom,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentTextField() {
    return Container(
      margin: EdgeInsets.only(left: 36.o, right: 4.o),
      alignment: Alignment.bottomCenter,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.o)),
              borderSide: const BorderSide(color: Color(0xffE5EBFB))),
          labelStyle: theme.styleMontserratBlack
              .copyWith(fontSize: 14.o, fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.o)),
              borderSide: BorderSide(color: theme.blue)),
          filled: true,
          fillColor: theme.white,
          hintText: 'Izohingizni yozing',
          hintStyle: theme.styleMontserratBlack.copyWith(
              fontSize: 14.o,
              fontWeight: FontWeight.w400,
              color: const Color(0xffADB6CD)),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Container(
                width: 42.o,
                height: 42.o,
                decoration:
                BoxDecoration(color: theme.blue, shape: BoxShape.circle),
                child: Icon(
                  Icons.send,
                  color: theme.white,
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildPassingContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            SVGImages.back,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(SVGImages.forward),
          onPressed: () {},
        )
      ],
    );
  }
}
