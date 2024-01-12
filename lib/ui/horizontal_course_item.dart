import 'package:courses/apptheme.dart';
import 'package:courses/ui/course_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HorizontalCourseItems extends StatefulWidget {
  const HorizontalCourseItems({super.key});

  @override
  State<HorizontalCourseItems> createState() => _HorizontalCourseItemsState();
}

class _HorizontalCourseItemsState extends State<HorizontalCourseItems> {
   // Initial color
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xffE9EEF7),
            borderRadius: BorderRadius.all(
              Radius.circular(10.o),
            ),
          ),
          width: 336.o,
          height: 125.o,
          margin: EdgeInsets.all(8.o),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Container()),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10.o)),
                    child: Image.asset(
                      PNGImages.coursePngImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 12.o,top: 6.o),
                    child: Text(
                      'Sotuvni o\'rganing',
                      textAlign: TextAlign.start,
                      style: theme.styleMontserratBlack.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 16.o),
                    ),
                  ),
                  SizedBox(
                    width: 223.o,
                    child: Padding(
                      padding:  EdgeInsets.only(left: 12.o,top: 6.o),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem',
                        textAlign: TextAlign.left,
                        style: theme.textStyleSimple.copyWith(
                            fontSize: 11.o, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return const CourseScreen(index: 0,);
                      },));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bizning kurslar',
                          style: theme.textStyleSimple.copyWith(
                              color: theme.blue,
                              fontWeight: FontWeight.w500),
                        ),
                        SvgPicture.asset(SVGImages.rightArrow),
                      ],
                    ),
                  )
                ],
              ),
              // Expanded(child: Container()),
            ],
          ),
        );
      },
    );
  }
}
