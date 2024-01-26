import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../apptheme.dart';
import '../../language.dart';
import '../../variables/images.dart';
import '../register/entering_phone_screen.dart';
import '../register/register_screen.dart';

class EnteringSystemBottomSheet extends StatefulWidget {
  const EnteringSystemBottomSheet({super.key});

  @override
  State<EnteringSystemBottomSheet> createState() =>
      _EnteringSystemBottomSheetState();
}

class _EnteringSystemBottomSheetState extends State<EnteringSystemBottomSheet> {
  var obscureRepeatPassword = true;
  TextEditingController phoneController = TextEditingController(text: '+998 (');

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom - 80;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              right: 12.o, bottom: 20.o + bottom, left: 12.o, top: 12.o),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 54.o,
                height: 5.o,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14.o)),
                    color: theme.btnBGColor),
                margin: EdgeInsets.symmetric(horizontal: 150.o),
              ),
              Container(
                  padding: EdgeInsets.only(top: 40.o),
                  height: 90.o,
                  width: 50.o,
                  child: Image.asset(PNGImages.sharkLogo)),
              if (bottom == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.o),
                      child: Text(
                        enteringSystem.tr,
                        textAlign: TextAlign.center,
                        style: theme.styleMontserratBlack.copyWith(
                            fontSize: 16.o, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      phoneNumber.tr,
                      style: theme.textStyleSimple.copyWith(
                          fontSize: 14.o, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      height: 44.o,
                      margin: EdgeInsets.symmetric(vertical: 12.o),
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [theme.phoneFormatter],
                        style: theme.styleMontserratBlack.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        cursorColor: theme.blue,
                        scrollPadding: EdgeInsets.only(bottom: keyboardHeight),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: theme.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.o))),
                            hintStyle: theme.styleMontserratBlack.copyWith(
                                fontSize: 14.o,
                                fontWeight: FontWeight.w400,
                                color: theme.gray1),
                            contentPadding:
                                EdgeInsets.only(top: 8.o, left: 18.o),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.o)),
                                borderSide:
                                     BorderSide(color: theme.btnBGColor)),
                            filled: true,
                            fillColor: theme.filledColor,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.o)),
                                borderSide:
                                    BorderSide(color: theme.btnBGColor)),
                            hintText: '+998'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'password',
                          style: theme.textStyleSimple.copyWith(
                              fontSize: 14.o, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 44.o,
                          child: TextField(
                            keyboardType:TextInputType.text ,
                            style: theme.styleMontserratBlack.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            cursorColor: theme.blue,
                            scrollPadding:
                                EdgeInsets.only(bottom: keyboardHeight),
                            obscureText: obscureRepeatPassword,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: theme.blue),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.o))),
                                hintStyle: theme.styleMontserratBlack.copyWith(
                                    fontSize: 14.o,
                                    fontWeight: FontWeight.w400,
                                    color: theme.gray1),
                                contentPadding:
                                    EdgeInsets.only(top: 8.o, left: 12.o),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.o)),
                                    borderSide:  BorderSide(
                                        color: theme.btnBGColor)),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureRepeatPassword =
                                            !obscureRepeatPassword;
                                      });
                                    },
                                    icon: Icon(obscureRepeatPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),color: theme.gray2,),
                                filled: true,
                                fillColor: theme.filledColor,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14.o)),
                                    borderSide:
                                        BorderSide(color: theme.btnBGColor)),
                                hintText: 'Password'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.o),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.o))),
                              backgroundColor: theme.blue),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RegisterScreen();
                              },
                            ));
                          },
                          child: Text(
                            enteringSystem.tr,
                            style: theme.styleMontserratBlack.copyWith(
                                color: theme.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.o),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const EnteringPhoneScreen();
                          },
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SVGImages.addPerson),
                          Padding(
                            padding: EdgeInsets.only(left: 14.o),
                            child: Text(
                              register.tr,
                              style: theme.styleMontserratBlack.copyWith(
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
    );
  }
}
