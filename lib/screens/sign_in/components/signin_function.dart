import 'package:flutter/material.dart';

// TODO this class checks the email and password for the existing member
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
          ],
        ),
      ),
    );
  }
}
