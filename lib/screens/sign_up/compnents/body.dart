import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/components/social_card.dart';
import 'package:woynshet_taem/screens/sign_up/compnents/sign_up_form.dart';
import 'package:woynshet_taem/size_config.dart';

final _formkey = GlobalKey<FormState>();

String email;
String password;
String confirm_password;
final List<String> errors = [];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.08,
            ),
            Text(
              "Register Account",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            SignUpForm(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
