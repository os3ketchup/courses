import 'package:courses/apptheme.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({
    super.key,
    required this.iconFail,
    required this.iconSuccess,
    required this.amountQuestion,
    required this.amountRightAnswer,
    required this.resultTitleSuccess,
    required this.resultTitleFail,
    required this.subResultTitleSuccess,
    required this.subResultTitleFail,
  });

  final String iconFail;
  final String iconSuccess;
  final String resultTitleSuccess;
  final String resultTitleFail;
  final String subResultTitleSuccess;
  final String subResultTitleFail;
  final int amountQuestion;
  final int amountRightAnswer;

  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {

  @override
  Widget build(BuildContext context) {
    bool result = widget.amountRightAnswer / widget.amountQuestion * 100 > 50;
    setState(() {
      result  = result;
    });

    return Center(
      child: SizedBox(
        width: 312.o,
        height: 418.o,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 229,
                height: 172,
                child: Image.asset(
                  result ? widget.iconSuccess : widget.iconFail,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 4.o),
              child: Text(
                result ? widget.resultTitleSuccess : widget.resultTitleFail,
                style: theme.styleMontserratBlack
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 20.o),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.o),
              child: Text(result ? widget.resultTitleSuccess : widget.subResultTitleFail,
                  style: theme.styleMontserratBlack
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 16.o)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.o),
                  child: Container(
                    width: 139.o,
                    height: 90.o,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.o)),
                      color: theme.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.amountQuestion.toString(),
                          style: theme.styleMontserratBlack.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 24.o),
                        ),
                        Text('Savollar soni',
                            style: theme.styleMontserratBlack.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 14.o)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.o),
                  child: Container(
                      width: 139.o,
                      height: 90.o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14.o)),
                        color: const Color.fromARGB(26, 0, 174, 48),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.amountRightAnswer.toString(),
                              style: theme.styleMontserratBlack.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 24.o),
                            ),
                            Text('Savollar soni',
                                style: theme.styleMontserratBlack.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.o)),
                          ])),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.o),
              width: double.infinity,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: theme.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.o)))),
                  child: Text(
                    'Qayta urinish',
                    textAlign: TextAlign.center,
                    style: theme.styleMontserratBlack.copyWith(
                        color: theme.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.o),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
