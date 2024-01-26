import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/our_courses/buy_course_bottom_sheet.dart';
import 'package:courses/ui/our_courses/course_advantage.dart';
import 'package:courses/ui/our_courses/course_content.dart';
import 'package:courses/ui/basic/home_appbar.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/custom_dialog.dart';

class AboutCourseScreen extends StatefulWidget {
  const AboutCourseScreen({super.key});

  @override
  State<AboutCourseScreen> createState() => _AboutCourseScreenState();
}

class _AboutCourseScreenState extends State<AboutCourseScreen> {
  List<bool> isClicked = [true, false];

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).viewInsets.bottom - 60.o;
    if (bottom < 0) {
      bottom = 0;
    }

    bottom = MediaQuery.of(context).viewInsets.bottom;
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
                      '”Call center”i bor tadbirkorlar uchun maxsus dastur, operator hamda menejerlar uchun o‘quv kursi 4 modul 27ta darsdan iborat bo‘lib, har bir dars menejerlarda sotuvdagi alohida ko‘nikmalarni shakllantiradi va ularning mijoz bilan ishalsh muommila ma\'daniyatini yaxshilaydi.',
                      style: theme.textStyleSimple.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14.o),
                    ),
                  ),
                  _buildChoosingButtons(),
                ],
              ),
            ),
            isClicked[0] ? const CourseContent() : const CourseAdvantage(),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: theme.white,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return BuyCourseBottomSheet();
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12.o),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: theme.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12.o))),
                  child: Text(
                    buy.tr,
                    textAlign: TextAlign.center,
                    style: theme.styleMontserratBlack.copyWith(
                        color: theme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.o),
                  ),
                )),
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

  void showBottomDialog(Widget dialog, BuildContext context) =>
      showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.o),
            topRight: Radius.circular(30.o),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: theme.green,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        },
      );




}
