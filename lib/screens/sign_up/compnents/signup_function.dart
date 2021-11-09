import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// class and function to create new user
class SignUpForm extends StatefulWidget {
  SignUpForm({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.image,
  });
  String name;
  String email;
  String phone;
  String password;
  XFile image;

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
            widget.name,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Text(
            widget.email,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Text(
            widget.phone,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Text(
            widget.password,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ]),
      ),
    );
  }
}
