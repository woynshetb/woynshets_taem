import 'package:flutter/material.dart';
import 'package:woynshet_taem/Widgets/customTextField.dart';
import 'package:woynshet_taem/components/default_button.dart';

import 'package:file/file.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController firstnameTextEditingController =
      TextEditingController();

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController cpasswordTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController addressTextEditingController =
      TextEditingController();
  String urlImageUrl = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File imageFile;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            InkWell(
              onTap: () => print("selected"),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    imageFile == null ? null : FileImage(imageFile),
                child: imageFile == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        size: 50,
                        color: Colors.white,
                      )
                    : null,
                backgroundColor: imageFile == null ? Colors.orange : null,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomeTextField(
                    controller: firstnameTextEditingController,
                    data: Icons.person,
                    isObsecure: false,
                    hintText: "Full Name",
                  ),
                  CustomeTextField(
                    controller: emailTextEditingController,
                    data: Icons.mail,
                    isObsecure: false,
                    hintText: "e-mail",
                  ),
                  CustomeTextField(
                    controller: passwordTextEditingController,
                    data: Icons.lock,
                    isObsecure: true,
                    hintText: "password",
                  ),
                  CustomeTextField(
                    controller: cpasswordTextEditingController,
                    data: Icons.lock,
                    isObsecure: true,
                    hintText: "confirm password",
                  ),
                  CustomeTextField(
                    controller: phoneTextEditingController,
                    data: Icons.phone,
                    isObsecure: false,
                    hintText: "Phone number",
                  ),
                  CustomeTextField(
                    controller: addressTextEditingController,
                    data: Icons.home,
                    isObsecure: true,
                    hintText: "Address",
                  ),
                  DefaultButton(
                    press: () {
                      print("submit button is pressed ");
                    },
                    text: "SignUp",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 4,
                    width: 5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
