import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/features/app/ui/pages/login.dart';
import 'package:login_page/features/app/ui/pages/register.dart';

import 'package:login_page/model/user.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePage();
}

class _LanguagePage extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        minimumSize: const Size(150, 90),
        primary: Colors.white,
        textStyle: const TextStyle(
            fontSize: 20, color: Colors.lightBlue, fontWeight: FontWeight.w300));
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      await context.setLocale(Locale('ru'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Русский",
                      style: TextStyle(
                          color: Colors.blue, fontFamily: 'Montserrat'),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      await context.setLocale(Locale('kz'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Қазақша",
                      style: TextStyle(
                          color: Colors.lightBlue, fontFamily: 'Montserrat'),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      await context.setLocale(Locale('en'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                          color: Colors.lightBlue, fontFamily: 'Montserrat'),
                    )),
              ],
            )),
      ),
    );
  }
}
