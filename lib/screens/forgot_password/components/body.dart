import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/components/no_account_text.dart';
import 'package:woynshet_taem/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your mail and we will \n send you alink to reset your password",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              ForgotPasswordForm(),
              Image.asset("assets/images/forget.png")
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    List<String> errors = [];
    String email;
    return Form(
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
            height: getProportionateScreenHeight(50),
          ),
          DefaultButton(
            text: "Continue",
            press: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          NoAccount()
        ],
      ),
    );
  }
}
