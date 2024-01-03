import 'package:courses/apptheme.dart';
import 'package:courses/ui/comments_content.dart';
import 'package:courses/ui/course_content_appbar.dart';
import 'package:courses/ui/description_content.dart';
import 'package:courses/ui/register_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../language.dart';
import '../variables/icons.dart';

class CourseContentItem extends StatefulWidget {
  const CourseContentItem({super.key});

  @override
  State<CourseContentItem> createState() => _CourseContentItemState();
}

class _CourseContentItemState extends State<CourseContentItem> {
  List<bool> isClicked = [true, false];
  String? selectedValue;
  var obscureRepeatPassword = true;

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).viewInsets.bottom - 80.o;
    if (bottom < 0) {
      bottom = 0;
    }

    final List<String> items = [
      'lorem ipsum',
      'ipsum lorem',
      'black lorem',
      'apple green',
    ];
    bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(144.o),
        child: CourseContentAppbar(selectedValue,
            contentList: items,
            toolbarName: courseThemes.tr,
            toolbarIcon: SVGImages.backIcon),
      ),
      body: Container(
        color: theme.bgCourse,
        child: Container(
          margin: EdgeInsets.all(12.o),
          child: Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.o),
                    child: GestureDetector(
                      onTap: () {
                        showBottomDialog(
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 12.o, bottom: 20.o + bottom,left: 12.o,top: 12.o),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      width: 54.o,
                                      height: 5.o,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(14.o)),
                                          color: theme.btnBGColor),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 150.o),
                                    ),
                                    SizedBox(
                                        height: 90.o,
                                        width: 50.o,
                                        child:
                                            Image.asset(PNGImages.sharkLogo)),
                                    if (bottom == 0)
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 14.o),
                                            child: Text(
                                              enteringSystem.tr,
                                              textAlign: TextAlign.center,
                                              style: theme.styleMontserratBlack
                                                  .copyWith(
                                                      fontSize: 16.o,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                          Text(
                                            phoneNumber.tr,
                                            style: theme.textStyleSimple
                                                .copyWith(
                                                    fontSize: 14.o,
                                                    fontWeight:
                                                        FontWeight.w400),
                                            textAlign: TextAlign.start,
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 8.o),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: theme.btnBGColor,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  14.o)),
                                                      borderSide: BorderSide(
                                                          color:
                                                              theme.btnBGColor)),
                                                  hintText: '+998'),
                                            ),
                                          ),
                                          _buildPasswordContainer(password.tr,
                                              obscureRepeatPassword, (value) {
                                            setState(() {
                                              obscureRepeatPassword = value;
                                            });
                                          }),
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.o),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.o))),
                                                    backgroundColor:
                                                        theme.blue),
                                                onPressed: () {},
                                                child: Text(
                                                  enteringSystem.tr,
                                                  style: theme
                                                      .styleMontserratBlack
                                                      .copyWith(
                                                          color: theme.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 17.o),
                                                )),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return const RegisterScreen();
                                              },));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(SVGImages.addPerson),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 14.o),
                                                  child: Text(
                                                    register.tr,
                                                    style: theme.styleMontserratBlack
                                                        .copyWith(
                                                        color: theme.blue,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 16.o),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ),
                            context);
                      },
                      child: Image.asset(
                        PNGImages.playLessonRoom,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _buildChoosingButton(),
                  isClicked[0]
                      ? const DescriptionContent()
                      : const CommentsContent(),
                ],
              ),
              isClicked[0] ? _buildPassingContainer() : Container(),
            ],
          ),
        ),
      ),
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

  Widget _buildPassingContainer() {
    return Container(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: SvgPicture.asset(SVGImages.back),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(SVGImages.forward),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildPasswordContainer(
      String label, bool obs, ValueChanged<bool> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textStyleSimple
              .copyWith(fontSize: 14.o, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.o),
          child: TextField(
            obscureText: obs,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      onChanged(!obs);
                    },
                    icon: Icon(obs
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined)),
                filled: true,
                fillColor: theme.btnBGColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.o)),
                    borderSide: BorderSide(color: theme.btnBGColor)),
                hintText: 'Password'),
          ),
        ),
      ],
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
}
