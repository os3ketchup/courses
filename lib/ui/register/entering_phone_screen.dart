import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/network/provider.dart';
import 'package:courses/ui/register/pinput.dart';
import 'package:courses/ui/register/register_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';

class EnteringPhoneScreen extends StatefulWidget {
  const EnteringPhoneScreen({super.key});

  @override
  State<EnteringPhoneScreen> createState() => _EnteringPhoneScreenState();
}

class _EnteringPhoneScreenState extends State<EnteringPhoneScreen> {
  TextEditingController _textEditingController = TextEditingController();



  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 12.o, bottom: 12.o),
              child: Text(
                phoneNumber.tr,
                style: theme.styleMontserratBlack
                    .copyWith(fontSize: 16.o, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.o),
              height: 44.o,
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10.o, left: 10.o),
                  hintText: "+998",
                  hintMaxLines: 1,
                  hintStyle: theme.styleMontserratBlack.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.o,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.o),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.o),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.o),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.o, top: 10.o),
              child: Text(
                '*Ushbu telefon raqamga, sms-kod keladi.',
                style: theme.styleMontserratBlack.copyWith(
                    fontSize: 12.o,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Color(0xff7784A4)),
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.all(12.o),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.o))),
                      backgroundColor: theme.blue),
                  onPressed: () {
                    saleNotifier.register(_textEditingController.text.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    },));
                  },
                  child: Text(
                    keep.tr,
                    style: theme.styleMontserratBlack.copyWith(
                        fontSize: 17.o,
                        fontWeight: FontWeight.w600,
                        color: theme.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
