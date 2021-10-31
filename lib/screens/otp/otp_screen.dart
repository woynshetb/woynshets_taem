import 'package:flutter/material.dart';
import 'package:woynshet_taem/screens/otp/components/body.dart';

class OTPScreen extends StatelessWidget {
  static String routName = "/otp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One Time Password Code"),
      ),
      body: Body(),
    );
  }
}
