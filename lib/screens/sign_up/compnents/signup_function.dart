import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/screens/home/home-screen.dart';

// class and function to create new user
class SignUpForm extends StatefulWidget {
  String name;
  String email;
  String phone;
  String password;
  XFile image;
  SignUpForm({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.image,
  });

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Text(
            "Welcome ${widget.name} click go to home page to continue",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          DefaultButton(
            text: "Go to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          )
        ]),
      ),
    );
  }
}
