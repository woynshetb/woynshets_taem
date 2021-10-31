import 'package:flutter/material.dart';
import 'package:woynshet_taem/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Passowrd  ",
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(),
    );
  }
}
