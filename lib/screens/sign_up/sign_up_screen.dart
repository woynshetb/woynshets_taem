import 'package:flutter/material.dart';
import 'package:woynshet_taem/screens/sign_up/compnents/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "./sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Body(),
    );
  }
}
