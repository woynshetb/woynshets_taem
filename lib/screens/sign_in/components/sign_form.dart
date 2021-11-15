import 'package:flutter/material.dart';

import 'package:woynshet_taem/Widgets/customTextField.dart';
import 'package:woynshet_taem/components/default_button.dart';

import 'package:woynshet_taem/screens/forgot_password/forgot_password.dart';
import 'package:woynshet_taem/screens/sign_in/components/signin_function.dart';
import 'package:woynshet_taem/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController eEmailTextEditingController = TextEditingController();
    TextEditingController ePassTextEditingController = TextEditingController();
    final _formkey = GlobalKey<FormState>();

    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomeTextField(
            controller: eEmailTextEditingController,
            data: Icons.mail,
            hintText: "ENTER EMAIL",
            isObsecure: false,
            val: (controller) {
              if (controller == null || controller.isEmpty) {
                return 'email';
              }
              return null;
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          CustomeTextField(
            controller: ePassTextEditingController,
            data: Icons.lock_outline,
            hintText: "ENTER PASSWORD",
            isObsecure: true,
            val: (controller) {
              if (controller == null || controller.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
            text: "Login",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInFunc(
                            email: eEmailTextEditingController.text,
                            password: ePassTextEditingController.text,

                            // go to login success page
                          )));
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
