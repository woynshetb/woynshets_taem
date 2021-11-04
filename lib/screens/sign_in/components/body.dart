import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:woynshet_taem/components/no_account_text.dart';
import 'package:woynshet_taem/components/social_card.dart';

import 'package:woynshet_taem/screens/sign_in/components/sign_form.dart';
import 'package:woynshet_taem/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Overlock"),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Image.asset("assets/images/login.png"),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                SignForm(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                NoAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
