import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

import 'my_course_appbar.dart';

class FrequentlyAskedQuestion extends StatefulWidget {
  const FrequentlyAskedQuestion({super.key});

  @override
  State<FrequentlyAskedQuestion> createState() =>
      _FrequentlyAskedQuestionState();
}

class _FrequentlyAskedQuestionState extends State<FrequentlyAskedQuestion> {
  List<bool> _isExpandedList = List.generate(4, (_) => false); // List
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(94.o),
        child: MyCourseAppbar(
          titleAppbar: faq.tr,
        ),
      ),
      body: Container(
        color: theme.bgCourse,
        child: Container(
          margin: EdgeInsets.all(12.o),
          child: ListView.builder(
            itemCount: 4, // Replace this with your actual item count
            itemBuilder: (BuildContext context, int index) {
              return _buildExpandableItem(
                'Item $index',
                'Subtitle for item $index',
                index,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableItem(String title, String subtitle, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.o)),
        color: theme.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 6.o),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.o)),
          backgroundColor: Colors.white,
          leading: _isExpandedList[index]
              ? const Icon(Icons.remove)
              : const Icon(Icons.add),
          title: Text(
            title,
            style: theme.styleMontserratBlack
                .copyWith(fontSize: 16.o, fontWeight: FontWeight.w500),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          onExpansionChanged: (isExpanded) {
            setState(() {
              _isExpandedList[index] = isExpanded;
            });
          },
          initiallyExpanded: _isExpandedList[index],

          children: <Widget>[
            Divider(height: 1.o),
            ListTile(
              title: Text(subtitle,
                  style: theme.styleMontserratBlack
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14,color: const Color(0xff666C76))),
            ),
          ],
        ),
      ),
    );
  }
}
