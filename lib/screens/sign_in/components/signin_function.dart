import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/screens/login_success/login_success.dart';

//function to autenticate existing member and if the user is a member go to home
class SignInFunc extends StatefulWidget {
  SignInFunc({this.email, this.password});
  String email;
  String password;

  @override
  _SignInFuncState createState() => _SignInFuncState();
}

class _SignInFuncState extends State<SignInFunc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.email),
            Text(widget.password),
            DefaultButton(
              text: "continue",
              press: () {
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
