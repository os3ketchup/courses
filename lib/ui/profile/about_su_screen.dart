import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'my_course_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(94.o),
          child: MyCourseAppbar(
            titleAppbar: aboutUs.tr,
          )),
      body: Container(
        color: theme.bgCourse,
        child: Container(
          margin: EdgeInsets.all(12.o),
          child: ListView(
            children: [
              Image.asset(
                PNGImages.smilePerson,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.o),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting\, remaining essentially unchanged',
                  style: theme.styleMontserratBlack
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 17.o),
                ),
              ),
              for (final items in [
                "Sotuvda 14 yillik tajribaga ega",
                "18 yoshida Hindistonning 1,000 kishilik “Outsorce Call center”ida faoliyatini boshlagan.",
                "Rossiya va Yevropa davlatlariga “sovuq” qo’ng’iroq orqali xizmat va mahsulotlarni sotgan",
                "· Youtube platformasida biznesga tegishli eng ko’p ko’riladigan, “Anonim Qo’ng’iroq” ko’rsatuv muallifi.",
                "Bugungi kunda “Shark” sotuv maktabi asoschisi. Ushbu maktabda 2020-yildan beri 300+ sotuv menejerlarini tayyorlangan."
              ])
                _buildAdvantages(items),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdvantages(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.o),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                SVGImages.done,
                fit: BoxFit.cover,
              ),

            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.o),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: theme.styleMontserratBlack
                    .copyWith(fontSize: 14.o, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
