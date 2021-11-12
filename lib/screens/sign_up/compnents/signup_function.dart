import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/screens/home/home-screen.dart';
import 'package:http/http.dart' as http;

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
  void initState() {
    super.initState();
  }

  signUp(String name, String email, String phone, String password,
      XFile imagepath) async {
    try {
      var url = Uri.parse('https://woynshetstaem.herokuapp.com/signup');
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email;
      request.fields['full_name'] = name;
      request.fields['password'] = password;
      request.fields['mobile_phone'] = phone;
      var image_file =
          await http.MultipartFile.fromPath('profile_image', imagepath.path);
      request.files.add(image_file);
      http.StreamedResponse response = await request.send();
      final responseString = await http.Response.fromStream(response);
      print(jsonDecode(responseString.body));
    } catch (exception) {} finally {}
  }

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
          ),
          SizedBox(
            height: 20,
          ),
          DefaultButton(
            text: "Confirm",
            press: () {
              signUp(widget.name, widget.email, widget.phone, widget.password,
                  widget.image);
            },
          ),
        ]),
      ),
    );
  }
}

signUp() async {
  try {
    var url = Uri.parse('https://woynshetstaem.herokuapp.com/signup');
    var request = http.MultipartRequest('POST', url);
    request.fields['email'] = '4yetemareke@gmail.com';
    request.fields['full_name'] = 'Woynshet Taem';
    request.fields['password'] = 'password2';
    request.fields['mobile_phone'] = '0911223355';
    var image_file = await http.MultipartFile.fromPath(
        'profile_image', '/home/veduke/Downloads/icon-programmer-19.jpg');
    request.files.add(image_file);
    http.StreamedResponse response = await request.send();
    final responseString = await http.Response.fromStream(response);
    print(jsonDecode(responseString.body));
  } catch (exception) {} finally {}
}
