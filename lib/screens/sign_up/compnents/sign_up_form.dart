import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/screens/complete_profile/complete_profile.dart';
import 'package:woynshet_taem/screens/sign_up/compnents/body.dart';
import 'package:woynshet_taem/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            buildEmailFormFrield(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            TextFormField(
              obscureText: true,
              onSaved: (newValue) => password = newValue,
              decoration: InputDecoration(
                  labelText: "password",
                  hintText: "Enter your password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // suffixIcon: SvgPicture.asset("assets/icons/Mail.jpg"),
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.lock),
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            TextFormField(
              obscureText: true,
              onSaved: (newValue) => confirm_password = newValue,
              decoration: InputDecoration(
                  labelText: "Confirm password",
                  hintText: "Re-Enter your password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // suffixIcon: SvgPicture.asset("assets/icons/Mail.jpg"),
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Icon(Icons.lock),
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
          ],
        ),
      ),
    );
  }
}

TextFormField buildEmailFormFrield() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    onSaved: (newValue) => email = newValue,
    decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: SvgPicture.asset("assets/icons/Mail.jpg"),
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(Icons.mail),
        )),
  );
}
