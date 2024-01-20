import 'package:courses/language.dart';
import 'package:courses/network/provider.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../apptheme.dart';
import '../profile/my_course_appbar.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen( {this.code = '',super.key});

  String code ;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var obscureOldPassword = true;
  var obscureNewPassword = true;
  var obscureRepeatPassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    repeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double marginValue = MediaQuery.of(context).size.width * 0.92;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(94.o),
          child: MyCourseAppbar(
            titleAppbar: register.tr,
          )),
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
                  'Ismingiz',
                  style: theme.textStyleSimple
                      .copyWith(fontSize: 14.o, fontWeight: FontWeight.w400),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintStyle: theme.textStyleSimple.copyWith(
                        fontSize: 14.o,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffADB6CD)),
                    filled: true,
                    fillColor: theme.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.o)),
                        borderSide: BorderSide(color: theme.btnBGColor)),
                    hintText: 'Ismingizni kiriting'),
              ),
              Container(
                height: 44.o,
                padding: EdgeInsets.only(bottom: 10.o, top: 10.o),
                child: Text(
                  'Familiyangiz',
                  style: theme.textStyleSimple
                      .copyWith(fontSize: 14.o, fontWeight: FontWeight.w400),
                ),
              ),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                    hintStyle: theme.textStyleSimple.copyWith(
                        fontSize: 14.o,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffADB6CD)),
                    filled: true,
                    fillColor: theme.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14.o)),
                        borderSide: BorderSide(color: theme.btnBGColor)),
                    hintText: 'Familyangizni kiriting'),
              ),
              _buildPasswordContainer(
                  passwordController, newPassword.tr, obscureNewPassword,
                  (value) {
                setState(() {
                  obscureNewPassword = value;
                });
              }),
              _buildPasswordContainer(
                  repeatController, repeatNewPassword.tr, obscureRepeatPassword,
                  (value) {
                setState(() {
                  obscureRepeatPassword = value;
                });
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: PreferredSize(
        preferredSize: Size.fromHeight(48.o),
        child: Consumer(
          builder: (context, ref, child) {
            return Container(
              decoration: BoxDecoration(
                  color: theme.blue,
                  borderRadius: BorderRadius.all(Radius.circular(12.o))),
              width: marginValue,
              child: TextButton(
                child: Text(
                  keep.tr,
                  style: theme.textStyleSimple.copyWith(
                      fontSize: 17.o,
                      fontWeight: FontWeight.w600,
                      color: theme.white),
                ),
                onPressed: () {
                  saleNotifier.signUp(nameController.text.toString(),lastNameController.text.toString(), widget.code,
                      '+998943900057', passwordController.text.toString(), repeatController.text.toString());
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPasswordContainer(TextEditingController controller, String label,
      bool obs, ValueChanged<bool> onChanged) {
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
        TextField(
          controller: controller,
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
              fillColor: theme.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.o)),
                  borderSide: BorderSide(color: theme.btnBGColor)),
              hintText: 'Password'),
        ),
      ],
    );
  }
}
