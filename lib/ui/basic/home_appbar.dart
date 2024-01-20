import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../apptheme.dart';
import '../../language.dart';
import '../../variables/icons.dart';

class AppBarContainer extends StatefulWidget {
   AppBarContainer(this.imageSpace,
      {required this.toolbarName, required this.toolbarIcon, super.key});

  final String toolbarName;
  final String toolbarIcon;
   Container imageSpace = Container();

  @override
  State<AppBarContainer> createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.o),
          bottomLeft: Radius.circular(10.o),
        ),
        color: Colors.white, // Background color of the "card"
      ),
      height: 98.o,
      child: Padding(
        padding: EdgeInsets.only(top: 20.o),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(widget.toolbarIcon),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.toolbarName,
                  style: theme.styleMontserratBlack.copyWith(fontSize: 18.o,fontWeight: FontWeight.w500),
                ),
              ),
            ),
            widget.imageSpace,
          ],
        ),
      ),
    );
  }
}
