import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/basic/home_page.dart';
import 'package:courses/util_variables.dart';
import 'package:courses/variables/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              PNGImages.photo,
              width: double.infinity,
              height: 493.o,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(left: 13.o, right: 13.o, top: 32.o),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 16.o),
                    child: Text(
                     'Islombek Ibragimov',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.pacifico(
                          color: theme.blue, fontSize: 16.o),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 16.o),
                    child: Text(
                      'Sotuvni Professionaldan o’rganing',
                      textAlign: TextAlign.start,
                      style: theme.styleMontserratBlack
                          .copyWith(fontWeight: FontWeight.w700,fontSize: 24.o),
                    ),
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ',
                    textAlign: TextAlign.justify,
                    style: theme.textStyleSimple
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 16.o),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context){
           return const HomePage();
         }));
        },
        shape: const CircleBorder(),
        backgroundColor: theme.blue,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
