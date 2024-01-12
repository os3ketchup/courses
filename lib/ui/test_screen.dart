import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/test_list.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../variables/icons.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children:[
            Center(
              child: SizedBox(
                width: 302.o,
                height: 286.o,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(PNGImages.list),
                    Text(
                      startTest.tr,
                      style: theme.styleMontserratBlack
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 20.o),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Repellat perspiciatis cum! Doloremque ea viverra eu doloremque tellus aliqua gravida fuga dolorum augue, donec beatae.',
                      style: theme.styleMontserratBlack
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 14.o),
                    ),
                    Container(
                      width: 302.o,
                      padding: EdgeInsets.symmetric(vertical: 8.o),
                      child: TextButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.o))),
                              backgroundColor: theme.blue),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ExampleRadioGroup();
                            },));
                          },
                          child: Text(
                            startTest.tr,
                            style: theme.styleMontserratBlack.copyWith(
                                color: theme.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.o),
                          )),
                    ),

                  ],
                ),
              ),
            ),
          ] ,
        ),
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

}
