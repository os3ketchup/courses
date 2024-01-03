import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/course_advantage.dart';
import 'package:courses/ui/course_content.dart';
import 'package:courses/ui/home_appbar.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutCourseScreen extends StatefulWidget {
  const AboutCourseScreen({super.key});

  @override
  State<AboutCourseScreen> createState() => _AboutCourseScreenState();
}

class _AboutCourseScreenState extends State<AboutCourseScreen> {
  List<bool> isClicked = [true, false];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarContainer(Container(),
            toolbarName: aboutCourse.tr, toolbarIcon: SVGImages.backIcon),
      ),
      body: Container(
        color: theme.bgCourse,
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.all(12.o),
                child: Image.asset(
                  PNGImages.mainRoom,
                  fit: BoxFit.fill,
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.o),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Anonim qo\'ng\'iroqlar',
                    style: theme.styleMontserratBlack
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20.o),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.o),
                    child: Text(
                      '100 000 UZS',
                      style: theme.styleMontserratBlack.copyWith(
                          color: theme.blue,
                          fontSize: 16.o,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.o, bottom: 12.o),
                    child: Text(
                      'dasdasdasdas dasdasdasdasdas dasdasdasdadasd asdasdadas dasdasdasdas dasdasdasdas dasdasdasdasdas dasdasdasdadasd asdasdadas dasdasdasdas dasdasdasdas dasdasdasdasdas dasdasdasdadasd asdasdadas dasdasdasdas dasdasdasdas dasdasdasdasdas dasdasdasdadasd asdasdadas dasdasdasdas',
                      style: theme.textStyleSimple.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14.o),
                    ),
                  ),
                  _buildChoosingButtons(),
                ],
              ),
            ),
            isClicked[0] ? const CourseContent() : const CourseAdvantage(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.o),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: theme.blue),
                  onPressed: () {},
                  child: Text(
                    buy.tr,
                    style: theme.styleMontserratBlack.copyWith(
                        color: theme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.o),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoosingButtons() {
    return Container(
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
                    courseThemes.tr,
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
                    advantagesAndRequirements.tr,
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
}
