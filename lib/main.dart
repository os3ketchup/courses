import 'dart:io';

import 'package:courses/apptheme.dart';
import 'package:courses/language.dart';
import 'package:courses/ui/splash_screen.dart';
import 'package:courses/util_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: languages[0],
    supportedLocales: languages,
  );
  await delegate.changeLocale(Locale(languages[0]));
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  ).then(
    (_) => runApp(
      LocalizedApp(
        delegate,
        const ProviderScope(
          child: ProviderScope(child: MyApp()),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    if (Platform.isAndroid) {}
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }


  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: ThemeData(
          platform: TargetPlatform.iOS,bottomSheetTheme: BottomSheetThemeData(backgroundColor: theme.white,modalBackgroundColor: theme.white)
        ),
        builder: (BuildContext context, Widget? child) {
          height = MediaQuery.of(context).size.height / 600;
          width = MediaQuery.of(context).size.width / 600;
          arifmethic = (height + width) / 2;
          //FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
          return MediaQuery(
            data: MediaQuery.of(context),
            child: child!,
          );
        },
        home: const SplashScreen(),
      ),
    );
  }
}
