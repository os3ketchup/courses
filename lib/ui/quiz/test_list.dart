import 'dart:async';

import 'package:courses/apptheme.dart';
import 'package:courses/ui/quiz/result_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../data/quiz_question.dart';
import '../../language.dart';
import '../../variables/icons.dart';
import '../our_courses/course_content_appbar.dart';

class ExampleRadioGroup extends StatefulWidget {
  const ExampleRadioGroup({super.key});

  @override
  ExampleRadioGroupState createState() {
    return ExampleRadioGroupState();
  }
}

class ExampleRadioGroupState extends State<ExampleRadioGroup> {
  final List<String> _verticalGroupValues = List.generate(4, (_) => "Pending");

  final questions = [
    const QuizQuestion(
        'Is it my first question?', ['yes', 'no', 'maybe', 'or']),
    const QuizQuestion(
        'Is it my second question?', ['yes', 'no', 'maybe', 'or']),
    const QuizQuestion(
        'Is it my third question?', ['yes', 'no', 'maybe', 'or']),
    const QuizQuestion(
        'Is it my third question?', ['yes', 'no', 'maybe', 'or']),
  ];

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
      backgroundColor: theme.bgCourse,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(144.o),
        child: CourseContentAppbar(0,
            contentList: items,
            toolbarName: courseThemes.tr,
            toolbarIcon: SVGImages.backIcon,onTap: (value) {

            },),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return _testBuilder(
                  questions[index].question, questions[index].answers, index);
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: theme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14.o),
                      topRight: Radius.circular(14.o))),
              padding: EdgeInsets.all(10.o),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.o))),
                          backgroundColor: theme.blue),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ResultScreen();
                          },
                        ));
                      },
                      child: Text(
                        buy.tr,
                        style: theme.styleMontserratBlack
                            .copyWith(color: theme.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.o),
                    child: SvgPicture.asset(SVGImages.timer),
                  ),
                  Text(
                    timer.tr,
                    style: theme.rubikStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _testBuilder(String question, List<String> answerList, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 14.o),
          child: Text(
            '${index + 1}. $question',
            textAlign: TextAlign.start,
            style: theme.styleMontserratBlack
                .copyWith(fontWeight: FontWeight.w600, fontSize: 16.o),
          ),
        ),
        RadioGroup<String>.builder(
          textStyle: theme.styleMontserratBlack
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.o),
          groupValue: _verticalGroupValues[index],
          onChanged: (value) => setState(() {
            _verticalGroupValues[index] = value ?? '';
          }),
          items: answerList,
          itemBuilder: (item) => RadioButtonBuilder(
            item,
            textPosition: RadioButtonTextPosition.right,
          ),
        ),
      ],
    );
  }
}
