import 'dart:async';

import 'package:flutter/material.dart';
import 'package:woynshet_taem/Config/config.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/forgot_password/forgot_password.dart';
import 'package:woynshet_taem/size_config.dart';

import '../../login_success/login_success.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();

    String email;
    String password;
    bool remember = false;

    final List<String> errors = [];
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  errors.add("please enter your email");
                });
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // suffixIcon: SvgPicture.asset("assets/icons/Mail.jpg"),
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: Icon(Icons.mail),
                )),
          ),
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
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              setState(() {
                Timer(Duration(seconds: 2), () async {
                  if (await EcommerceApp.collectionUser != null) {
                    Route route =
                        MaterialPageRoute(builder: (_) => LoginSuccessScreen());
                    Navigator.pushReplacement(context, route);
                  }
                });
              });
              // _formkey.currentState.save();
              // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orangeAccent,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
