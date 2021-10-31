import 'package:flutter/material.dart';
import 'package:woynshet_taem/screens/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Success",
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(),
    );
  }
}
