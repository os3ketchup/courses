import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../apptheme.dart';
import '../../language.dart';
import '../../variables/icons.dart';

class RegisterAppbar extends StatefulWidget {
  const RegisterAppbar(
     {
    super.key,
    required this.toolbarName,
    required this.toolbarIcon,
  });

  final String toolbarName;
  final String toolbarIcon;



  @override
  State<RegisterAppbar> createState() => _RegisterAppbarState();
}

class _RegisterAppbarState extends State<RegisterAppbar> {
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
            child: Container(
              padding: EdgeInsets.only(bottom: 2.o),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.o),
                      ),
                      color: theme.bgCourse,
                    ),
                    margin: EdgeInsets.all(8.o),
                    padding: EdgeInsets.only(
                        right: 15.o, left: 15.o, top: 13, bottom: 13.o),
                    child: SizedBox(
                        height: 10.o,
                        width: 6.o,
                        child: SvgPicture.asset(widget.toolbarIcon)),
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
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12.o,left: 12.o,right: 12.o),
            padding: EdgeInsets.only(left: 12.o,right: 12.o,bottom: 6.o,top: 6.o),

            decoration: BoxDecoration( color: theme.btnBGColor,borderRadius: BorderRadius.all(Radius.circular(12.o))),
            child: Row(
              children: [ Expanded(child: Text('+998 97 628 28 82 telefon raqamiga kod yuborildi, ushbu kodni kiriting',style: theme.styleMontserratBlack.copyWith(fontSize: 14.o,fontWeight: FontWeight.w400),)), SvgPicture.asset(SVGImages.edit2)],
            ),

          )        ],
      ),
    );
  }
}
