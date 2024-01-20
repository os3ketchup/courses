import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/profile/change_password_screen.dart';
import 'package:courses/ui/profile/my_course_appbar.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../variables/icons.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isPasswordChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(94.o),
          child: MyCourseAppbar(
            titleAppbar: editInfo.tr,
          )),
      body: Container(
        color: theme.bgCourse,
        child: Container(
          margin: EdgeInsets.all(12.o),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    height: 44.o,
                    padding: EdgeInsets.only(bottom: 10.o, top: 10.o),
                    child: Text(
                      'Ism va familiya',
                      style: theme.textStyleSimple.copyWith(
                          fontSize: 14.o, fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: theme.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.o)),
                            borderSide: BorderSide(color: theme.btnBGColor)),
                        hintText: authorName.tr),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16.o),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14.o)),
                          color: const Color(0xffE5EBFB)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ChangePasswordScreen(() {
                              setState(() {
                                isPasswordChanged = true;
                              });
                            });
                          },));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SVGImages.key),
                            Padding(
                              padding: EdgeInsets.only(left: 14.o),
                              child: Text(
                                changePassword.tr,
                                style: theme.styleMontserratBlack.copyWith(
                                    color: theme.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.o),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  isPasswordChanged
                      ? _showChangedText()
                      : Container(
                          width: 150.o,
                          height: 10.o,
                          color: theme.blue,
                        ),
                  SizedBox(
                    height: 450.o,
                  ),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      color: theme.blue,
                      borderRadius: BorderRadius.all(Radius.circular(14.o))),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      save.tr,
                      style: theme.textStyleSimple.copyWith(
                          color: theme.white,
                          fontSize: 16.o,
                          fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _showChangedText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.o),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.o),
            child: const Icon(Icons.done, color: Colors.green),
          ),
          Text(
            successPassword.tr,
            style: theme.styleMontserratBlack.copyWith(
                fontSize: 14.o,
                fontWeight: FontWeight.w600,
                color: Colors.green),
          )
        ],
      ),
    );
  }
}
