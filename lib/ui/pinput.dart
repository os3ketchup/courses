import 'dart:async';

import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../apptheme.dart';



class RegisterPinPut extends StatefulWidget {
  const RegisterPinPut({super.key});

  @override
  State<RegisterPinPut> createState() => _RegisterPinPutState();
}

class _RegisterPinPutState extends State<RegisterPinPut> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  int _counter = 60; // Initial counter value in seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color focusedBorderColor = theme.primary;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    Color borderColor = theme.grey;

    final defaultPinTheme = PinTheme(
      width: 56.o,
      height: 56.o,
      textStyle: TextStyle(
        fontSize: 22.o,
        color: theme.blue,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.o),
        border: Border.all(color: theme.blue),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => SizedBox(width: 8.o),
              validator: (value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 9.o),
                    width: 22.o,
                    height: 1.o,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8.o),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19.o),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
              startTimer();
            },
            child: _counter > 0
                ? Text(
              getFormattedTime(),
              style: theme.styleMontserratBlack,
            )
                : Text(
              'Отправте еще',
              style: theme.textStyle,
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel(); // Stop the timer when countdown reaches 0
        }
      });
    });
  }

  String getFormattedTime() {
    int minutes = _counter ~/ 60;
    int seconds = _counter % 60;
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$minutesStr:$secondsStr';
  }
}
