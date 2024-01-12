import 'package:courses/ui/success_widget.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../language.dart';
import '../variables/icons.dart';
import 'course_content_appbar.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final List<String> items = [
    'lorem ipsum',
    'test',
    'black lorem',
    'apple green',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FD),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(144.o),
        child: CourseContentAppbar(
          0,
          contentList: items,
          toolbarName: courseThemes.tr,
          toolbarIcon: SVGImages.backIcon,
          onTap: (value) {},
        ),
      ),
      body:  ListView(
        children: [
          SizedBox(height: 100.o,),
          const SuccessWidget(
            amountQuestion: 24,
            amountRightAnswer: 3,
            resultTitleSuccess: 'Ajoyib!!',
            resultTitleFail: 'O’xshamadi :(',
            subResultTitleSuccess: 'Siz keyingi darsga o’ta olmadingiz :(',
            subResultTitleFail: 'Siz keyingi darsga o’ta olmadingiz :(',
            iconSuccess: PNGImages.rock,
            iconFail: PNGImages.failBoy,
          ),
        ],
      ),
      floatingActionButton: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: _buildPassingContainer()),
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
