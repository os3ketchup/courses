import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentsContent extends StatefulWidget {
  const CommentsContent({super.key});

  @override
  State<CommentsContent> createState() => _CommentsContentState();
}

class _CommentsContentState extends State<CommentsContent> {
  List<String> list = ["dasda", "dasdasd", "dasdas"];



  @override
  Widget build(BuildContext context) {
    setState(() {
      list = list;
    });
    return Column(children: [
      list.isEmpty ? _showEmptyPlace() : Container(),
      for (final items in list)
        _showItems(),
    ]);
  }

  Widget _showItems() {
    return Container(
      padding: EdgeInsets.all(20.o),
      margin: EdgeInsets.all(8.o),
      decoration: BoxDecoration(
          border: Border.all(width: 1.o, color: theme.btnBGColor),
          color: theme.white,
          borderRadius: BorderRadius.all(Radius.circular(10.o))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(SVGImages.avatar),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Eshonov Fakhriyor',
                        style: theme.styleMontserratBlack.copyWith(
                            fontSize: 14.o, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '13.09.2023 1:59',
                        style: theme.textStyleSimple.copyWith(fontSize: 12.o),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Text(
              'Repellat perspiciatis cum! Doloremque ea viverra eu doloremque tellus aliqua gravida fuga dolorum augue, donec beatae. Class urna et doloremque facilisis autem risus fuga nullam quibusdam, tortor deleniti, accumsan dolorem? Posuere hac? Tellus maiores ullam ullamcorper, nostrud lacinia veniam torquent? Consequuntur a lobortis magnam mollis ac, explicabo nobis, pretium omnis, adipisci placerat, nostrum reiciendis? Illo natoque provident potenti ullamcorper quis hymenaeos lectus nobis nobis dui.'),
          SizedBox(
            width: 180.o,
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.o),
                    child: SvgPicture.asset(SVGImages.reply),
                  ),
                  Text(
                    reply.tr,
                    style: theme.styleMontserratBlack.copyWith(
                        color: const Color(0xff098BED),
                        fontSize: 16.o,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showEmptyPlace() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 120.o,
          ),
          SvgPicture.asset(SVGImages.comment),
          Text(
            commentNotFound.tr,
            style: theme.textStyleSimple,
          )
        ],
      ),
    );
  }
}
