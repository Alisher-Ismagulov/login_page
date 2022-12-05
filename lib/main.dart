import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/features/app/ui/pages/languages.dart';
import 'package:login_page/services/shared_preference.dart';
import 'package:login_page/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await sharedPreference.init();

  runApp(
    EasyLocalization(

      supportedLocales: [Locale('kz'), Locale('en'), Locale('ru')],
      fallbackLocale: Locale('kz'),
      path: 'assets/translate',
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const LanguagePage(),
    );
  }
}


