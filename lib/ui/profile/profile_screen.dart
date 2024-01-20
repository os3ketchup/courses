import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/our_courses/about_course_screen.dart';
import 'package:courses/ui/profile/about_us_screen.dart';
import 'package:courses/ui/profile/about_su_screen.dart';
import 'package:courses/ui/profile/faq_screen.dart';
import 'package:courses/ui/profile/my_courses_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.bgCourse,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.o),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14.o)),
              color: theme.white,
            ),
            height: 269.o,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.o),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 101.o,
                        width: 32.o,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50.o,
                            ),
                            SvgPicture.asset(SVGImages.myProfile),
                            SizedBox(
                              height: 10.o,
                            ),
                            Text(
                              'Eshonov Fakhriyor',
                              style: theme.styleMontserratBlack.copyWith(
                                  fontSize: 16.o, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const EditProfileScreen();
                                },
                              ));
                            },
                            icon: SvgPicture.asset(SVGImages.edit)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.o,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16.o, top: 10.o, bottom: 10.o),
                    height: 83.o,
                    width: 351.o,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14.o)),
                        color: theme.bgCourse),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 58.o,
                          width: 58.o,
                          child: SimpleCircularProgressBar(
                            progressColors: const [
                              Color(0xff375BB9),
                              Color(0xff4FF9F9),
                            ],
                            onGetText: (p0) {
                              return Text(
                                '${p0.toInt()}%',
                                style: theme.styleMontserratBlack.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.o),
                              );
                            },
                            progressStrokeWidth: 8,
                            backStrokeWidth: 0,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.o),
                          child: Text(
                            'Sizning harakatlaringiz a’lo darajada',
                            textAlign: TextAlign.start,
                            style: theme.styleMontserratBlack.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        )),
                        Image.asset(PNGImages.rocket),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              _buildProfileMenuItem(() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MyCoursesScreen();
                  },
                ));
              }, SVGImages.myCoursePlay, myCourses.tr),
              _buildProfileMenuItem(() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const AboutUsScreen();
                  },
                ));
              }, SVGImages.aboutUs, aboutUs.tr),
              _buildProfileMenuItem(() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const FrequentlyAskedQuestion();
                  },
                ));
              }, SVGImages.faq, faq.tr),
              _buildProfileMenuItem(() {}, SVGImages.star, estimateProgram.tr),
              SizedBox(
                height: 140.o,
              )
            ],
          ),
          _logOut(),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(
      void Function() onTapped, String assetName, String itemName) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: EdgeInsets.all(8.o),
        margin: EdgeInsets.only(bottom: 6.o, top: 6.o, left: 12.o, right: 12.o),
        height: 44.o,
        decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.all(Radius.circular(14.o))),
        child: Row(
          children: [
            SvgPicture.asset(assetName),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.o),
              child: Text(
                itemName,
                textAlign: TextAlign.start,
              ),
            )),
            SvgPicture.asset(SVGImages.caretRight)
          ],
        ),
      ),
    );
  }

  Widget _logOut() {
    return Container(
      padding: EdgeInsets.all(16.o),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  SVGImages.exit,
                  color: Colors.red,
                ),
                Text(
                  'Tizimdan chiqish',
                  style: theme.styleMontserratBlack.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                )
              ],
            ),
          ),
          Text(
            'Dastur versiyasi 1686.546',
            style: theme.styleMontserratBlack.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12.o,
                color: const Color(0xff7784A4)),
          )
        ],
      ),
    );
  }
}
