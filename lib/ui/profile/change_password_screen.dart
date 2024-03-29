import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

import '../../apptheme.dart';
import 'my_course_appbar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen(this.passwordChangedCallback, {super.key});

  final VoidCallback passwordChangedCallback;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var obscureOldPassword = true;
  var obscureRepeatPassword = true;
  var obscureNewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: theme.bgCourse,
        child: Container(
          margin: EdgeInsets.all(12.o),
          child: ListView(
            children: [
              Container(
                height: 44.o,
                padding: EdgeInsets.only(bottom: 10.o, top: 10.o),
                child: Text(
                  'Ism va familiya',
                  style: theme.textStyleSimple
                      .copyWith(fontSize: 14.o, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: 44.o,
                child: TextField(
                  style: theme.styleMontserratBlack
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  cursorColor: theme.blue,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 4.o, left: 12.o),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.btnBGColor),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.o))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.blue),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.o))),
                      hintStyle: theme.styleMontserratBlack.copyWith(
                          fontSize: 14.o,
                          fontWeight: FontWeight.w400,
                          color: theme.gray1),
                      filled: true,
                      fillColor: theme.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14.o)),
                          borderSide: BorderSide(color: theme.btnBGColor)),
                      hintText: 'Eshonov Fakhriyor'),
                ),
              ),
              _buildPasswordContainer(oldPassword.tr, obscureOldPassword,
                  (value) {
                setState(() {
                  obscureOldPassword = value;
                });
              }),
              _buildPasswordContainer(newPassword.tr, obscureNewPassword,
                  (value) {
                setState(() {
                  obscureNewPassword = value;
                });
              }),
              _buildPasswordContainer(
                  repeatNewPassword.tr, obscureRepeatPassword, (value) {
                setState(() {
                  obscureRepeatPassword = value;
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 12.o, bottom: 12.o, right: 12.o),
                      decoration: BoxDecoration(
                          color: theme.btnBGColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(14.o))),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            cancel.tr,
                            style: theme.styleMontserratBlack.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14.o),
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 12.o, bottom: 12.o, left: 12.o),
                      decoration: BoxDecoration(
                          color: theme.blue,
                          borderRadius:
                              BorderRadius.all(Radius.circular(14.o))),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              widget.passwordChangedCallback();
                            });
                          },
                          child: Text(
                            save.tr,
                            style: theme.styleMontserratBlack.copyWith(
                                color: theme.white,
                                fontSize: 14.o,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(94.o),
          child: MyCourseAppbar(
            titleAppbar: editInfo.tr,
          )),
    );
  }

  Widget _buildPasswordContainer(
      String label, bool obs, ValueChanged<bool> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44.o,
          padding: EdgeInsets.only(bottom: 10.o, top: 10.o),
          child: Text(
            label,
            style: theme.textStyleSimple
                .copyWith(fontSize: 14.o, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: 44.o,
          child: TextField(
            style: theme.styleMontserratBlack
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
            cursorColor: theme.blue,
            obscureText: obs,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 4.o, left: 12.o),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.btnBGColor),
                    borderRadius: BorderRadius.all(Radius.circular(12.o))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.blue),
                    borderRadius: BorderRadius.all(Radius.circular(12.o))),
                hintStyle: theme.styleMontserratBlack.copyWith(
                    fontSize: 14.o,
                    fontWeight: FontWeight.w400,
                    color: theme.gray1),
                suffixIcon: IconButton(
                    onPressed: () {
                      onChanged(!obs);
                    },
                    icon: Icon(
                      obs
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: theme.gray2,
                    )),
                filled: true,
                fillColor: theme.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.o)),
                    borderSide: BorderSide(color: theme.btnBGColor)),
                hintText: 'Password'),
          ),
        ),
      ],
    );
  }
}
