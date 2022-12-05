
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
    "register": "registration",
    "inputusername": "username / email",
    "inputphone": "phone number",
    "inputpassword": "password",
    "buttonSubmit": "sign Up",
    "haveacc": "already have an account?",
    "buttonSign": "sing in",
    "welcome": "welcome!",
    "noAcc": "Don't have an account?"
};
  static const Map<String,dynamic> ru = {
    "register": "регистрация",
    "inputusername": "имя/ email",
    "inputphone": "номер телефона",
    "inputpassword": "пароль",
    "buttonSubmit": "зарегистрироваться",
    "haveacc": "У вас есть есть аккаунт?",
    "buttonSign": "войти",
    "welcome": "добро пожаловать!",
    "noAcc": "у вас нет аккаунта?"
  };
static const Map<String,dynamic> kz = {
  "register": "тiркелу",
  "inputusername": "есімі/ email",
  "inputphone": "телефон нөмірі",
  "inputpassword": "Құпия сөз",
  "buttonSubmit": "тіркелу",
  "haveacc": "аккаунт бар ма?",
  "buttonSign": "кіру",
  "welcome": "Қош келiҢiздер!",
  "noAcc": "аккаунт жоқ па?"
};

static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "kz": kz, "ru": ru};
}
