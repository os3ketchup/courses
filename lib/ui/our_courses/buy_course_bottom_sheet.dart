import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

import '../../apptheme.dart';
import '../../language.dart';
import '../../variables/images.dart';
import '../custom_widgets/custom_dialog.dart';

class BuyCourseBottomSheet extends StatefulWidget {
  const BuyCourseBottomSheet({super.key});

  @override
  State<BuyCourseBottomSheet> createState() => _BuyCourseBottomSheetState();
}

class _BuyCourseBottomSheetState extends State<BuyCourseBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (bottom == 0)
            Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(14.o)),
                color: theme.btnBGColor,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: 160.o, vertical: 12.o),
              height: 5.o,
              width: 54.o,
            ),
          Container(
            padding: EdgeInsets.all(12.o),
            width: double.infinity,
            child: Text(
              'Kursni sotib olish',
              style: theme.styleMontserratBlack.copyWith(
                fontSize: 20.o,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: 12.o, left: 12.o, right: 12.o),
            width: double.infinity,
            child: Text(
              buyCourse.tr,
              style: theme.styleMontserratBlack.copyWith(
                  fontSize: 14.o,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.o),
            width: double.infinity,
            child: Text(
              'To\'lov tizimini tanlang',
              style: theme.styleMontserratBlack.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCardOptions(),
              _buildCardOptions(),
              _buildCardOptions()
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 12.o, vertical: 6.o),
              child: const Divider()),
          Container(
            padding: EdgeInsets.all(12.o),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kurs umumiy narxi',
                  style: theme.styleMontserratBlack.copyWith(
                      fontSize: 16.o,
                      fontWeight: FontWeight.w600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '100 000 UZS',
                      style: theme.styleMontserratBlack
                          .copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: theme.greyBetta),
                    ),
                    Text('100 000 UZS',
                        style: theme.styleMontserratBlack
                            .copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: theme.green)),
                  ],
                )
              ],
            ),
          ),
          Container(

            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(12.o)),
              color: theme.blue,
            ),
            margin: EdgeInsets.symmetric(
                horizontal: 12.o, vertical: 12.o),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                showPaymentDialog(context);
              },
              child: Text(
                'To’lov qilish',
                style: theme.styleMontserratBlack.copyWith(
                    color: theme.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.o),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildCardOptions() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.white,
            border: Border.all(width: 1.o, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12.o)),
          ),
          width: 109.o,
          height: 70.o,
          margin: EdgeInsets.all(6.o),
          child: Image.asset(PNGImages.clickImage),
        ),
        Container(
          width: 18.o,
          height: 18.o,
          decoration: BoxDecoration(
            border: Border.all(width: 1.o, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12.o)),
          ),
          child: Container(
            width: 16.o,
            height: 16.o,
            margin: EdgeInsets.all(2.o),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.o)),
                color: theme.blue),
          ),
        )
      ],
    );
  }
  void showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const PaymentDialog();
      },
    );
  }
}
