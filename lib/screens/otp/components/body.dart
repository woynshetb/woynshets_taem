//import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/otp/components/otp_form.dart';
import 'package:woynshet_taem/size_config.dart';

import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Text(
                "OTP Verfication",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
              Text("We sent your code to +251964001822"),
              buildTimer(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.15,
              ),
              OTPForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("this code will expired in"),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0),
        duration: Duration(seconds: 30),
        builder: (context, value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: kPrimaryColor),
        ),
        onEnd: () {},
      ),
    ],
  );
}
