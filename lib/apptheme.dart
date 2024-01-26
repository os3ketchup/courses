import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util_variables.dart';

_ThemeApp? _appTheme;

_ThemeApp get theme {
  _appTheme ??= _ThemeApp();
  return _appTheme!;
}

void updateTheme() {
  _appTheme = _ThemeApp();
  //updateNav();
}

class _ThemeApp {
  Color background = isDark ? const Color(0xFF29232E) : const Color(0xFFFAFAFA);
  Color text = isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  Color secondary = isDark ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
  Color mapbg = isDark ? const Color(0xFF242f3e) : const Color(0xFFF7F8F9);
  Color grey = isDark ? const Color(0xff7784A4) : const Color(0xFF7D7B77);
  Color numBackground =
      isDark ? const Color(0xFF29232E) : const Color(0xFFF9F9F9);
  Color dragDown = isDark ? const Color(0xF0444444) : const Color(0xFFF8F9F8);
  Color line = isDark ? const Color(0xFF655F6A) : const Color(0xFFE4E5E4);
  Color cardBackground =
      isDark ? const Color(0xFF332D38) : const Color(0xFFFFFFFF);
  Color card = isDark ? const Color(0xFF3D3742) : const Color(0xFFFFFFFF);
  Color green = isDark ? const Color(0xFF12FF2A) : const Color(0xFF059B14);
  Color yellow = isDark ? const Color(0xFFFFB200) : const Color(0xFFFFDD09);
  Color greyBG = isDark ? const Color(0xFF655F6A) : const Color(0xFFF8F9F8);

  Color primary = const Color(0xFF965A9F);
  Color lightRed = const Color(0xFFFF7272);
  Color red = const Color(0xFFFF2E00);
  Color container = const Color(0xFF303130);
  Color borderColor = const Color(0x3A000000);

  Color blue = const Color(0xff375BB9);
  Color bgCourse = const Color(0xffF5F5F5);
  Color white = const Color(0xffFFFFFF);
  Color btnBGColor = const Color(0xffE5EBFB);
  Color greyBetta = const Color(0x80000000);
  Color gray1 = const Color(0xffADB6CD);
  Color gray2 = const Color(0xff7784A4);
  Color filledColor = const Color(0xffF4F7FD);


  TextStyle styleMontserratBlack = GoogleFonts.montserrat(color: const Color(0xff000000));
  TextStyle textStyleSimple = GoogleFonts.montserrat(color: const Color(0xff1D2230));
  TextStyle rubikStyle = GoogleFonts.rubik(color: const Color(0xff000000),fontWeight: FontWeight.w500,fontSize: 16.o);


  String fontFamily = "IBMPlexSans";

  TextStyle textStyle = TextStyle(
    color: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
    fontFamily: "IBMPlexSans",
    decoration: TextDecoration.none,
    overflow: TextOverflow.ellipsis,
  );


  MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '+998 (##)-###-##-##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.eager,
  );

  MaskTextInputFormatter numberMaskFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.eager,
  );

  MaskTextInputFormatter yearMaskFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.eager,
  );

  MaskTextInputFormatter cvcMaskFormatter = MaskTextInputFormatter(
    mask: '###',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.eager,
  );

  BoxDecoration cardDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: isDark ? const Color(0xFF655F6A) : const Color(0xFFE4E5E4),
      width: 1,
    ),
    color: isDark ? const Color(0xFF332D38) : const Color(0xFFFFFFFF),
  );

  BoxDecoration get redDecor => cardDecor.copyWith(
        border: Border.all(
          color: const Color(0xFFFF2E00),
          width: 1,
        ),
      );

  BoxDecoration greyDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: isDark ? const Color(0xFF29232E) : const Color(0xFFF9F9F9),
    border: Border.all(
      width: 1,
      color: isDark ? const Color(0xFF655F6A) : const Color(0xFFEBE9E6),
    ),
  );

  BoxDecoration get selectedGreyDecor => greyDecor.copyWith(
        border: Border.all(
          width: 1,
          color: yellow,
        ),
      );

  ColorFilter colorFilter = ColorFilter.mode(
    isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
    BlendMode.srcIn,
  );

  ColorFilter greyFilter = ColorFilter.mode(
    isDark ? const Color(0xFFABA5B0) : const Color(0xFF7D7B77),
    BlendMode.srcIn,
  );

  AppBar get appbar => AppBar(
  title: Text('Подтверждение'),
    toolbarHeight: 0,
    elevation: 0,
    backgroundColor: theme.primary,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: theme.primary,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );





}
