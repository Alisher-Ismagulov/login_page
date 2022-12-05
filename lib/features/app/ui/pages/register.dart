import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page/features/app/ui/pages/login.dart';
import 'package:login_page/features/app/ui/pages/main_page.dart';
import 'package:login_page/model/user.dart';
import 'package:login_page/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Text(
                    LocaleKeys.register.tr(),
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                RegisterBox()
              ],
            )),
      ),
    );
  }
}

class RegisterBox extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _containerKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();
  final _passFocus = FocusNode();
  final _phoneFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _passFocus.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      width: 300,
      height: 340,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListView(
        key: _formKey,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextFormField(
              focusNode: _nameFocus,
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputusername.tr(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextFormField(
              controller: _phoneController,
              focusNode: _phoneFocus,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputphone.tr(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextFormField(
              controller: _passController,
              focusNode: _passFocus,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputpassword.tr(),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: (){
                _submitForm();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ));

              },
              child: Text(LocaleKeys.register.tr())
              ,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.haveacc.tr()),
                ElevatedButton(
                    onPressed: (){
                      _submitForm();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));

                    },
                    child: Text(LocaleKeys.buttonSign.tr())),


              ],
            ),
          ),


        ],
      ),
    );
  }
  void _submitForm() {
    {
      const url =
          'https://alsuher-4f702-default-rtdb.firebaseio.com/users.json';
      http.post(Uri.parse(url),
          body: jsonEncode({
            'name': _nameController.text,
            'phone': _phoneController.text,
            'password': _passController.text,
          }));
    }
  }
//
//
// void _showMessage({required String message}) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       duration: const Duration(seconds: 1),
//       backgroundColor: Colors.red,
//       content: Text(
//         message,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w600,
//           fontSize: 18.0,
//         ),
//       ),
//     ),
//   );
//
//   void _showDialog({required String name}) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text(
//             'Registration successful',
//             style: TextStyle(
//               color: Colors.green,
//             ),
//           ),
//           content: Text(
//             '$name is now a verified register form',
//             style: const TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 18.0,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         UserInfoPage(
//                           userInfo: newUser,
//                         ),
//                   ),
//                 );
//               },
//               child: const Text(
//                 'Verified',
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
}