import 'dart:math';

import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/screens/accounts/guestAccount.dart';
import 'package:woynshet_taem/screens/sign_in/sign_in_screen.dart';
import 'package:woynshet_taem/screens/sign_up/guestSignUp.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              text: "login",
              press: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
            ),
            SizedBox(
              height: 15,
            ),
            DefaultButton(
              text: "Continue as a Guest",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GuestMember()));
              },
            )
          ],
        ),
      ),
    );
  }
}

  // AuthMode _authMode = AuthMode.Login;
  // String email;
  // String password;
  // String phoneNumber;
  // Map<String, String> _authDataUser = {
  //   'email': '',
  //   'password': '',
  // };
  // Map<String, String> guestData = {'phoneNumber': ''};
  // var _isLoading = false;
  // final _passwordController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _phonenumberController = TextEditingController();

  // submitForUser(String email, String password) {
  //   print(email);
  //   print(password);
  //   setState(() {
  //     // user
  //     _isLoading = false;
  //   });
  // }

  // submitForGuest(String phonenumber) {
  //   setState(() {
  //     // guest
  //     _isLoading = false;
  //   });
  // }

  // switchAuthMode() {
  //   if (_authMode == AuthMode.Login) {
  //     setState(() {
  //       _authMode = AuthMode.Guest;
  //     });
  //   } else {
  //     setState(() {
  //       _authMode = AuthMode.Login;
  //     });
  //   }
  // }
