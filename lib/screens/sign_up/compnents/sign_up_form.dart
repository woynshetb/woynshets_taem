import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/complete_profile/complete_profile.dart';
import 'package:woynshet_taem/size_config.dart';
import 'package:file/file.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController firstnameTextEditingController =
      TextEditingController();
  final TextEditingController lastnameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController cpasswordTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController homephoneTextEditingController =
      TextEditingController();
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InkWell(
              child: Column(
                children: [
                  // will implement get photo from gallary
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    backgroundImage:
                        imageFile == null ? null : FileImage(imageFile),
                    child: imageFile == null
                        ? Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.black,
                          )
                        : null,
                    radius: 70,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              onTap: () {
                print("selected file");
              },
            ),
            buildEmailFormFrield(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            TextFormField(
              obscureText: true,
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
    decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(Icons.mail),
        )),
  );
}
