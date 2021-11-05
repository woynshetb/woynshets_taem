import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextField extends StatelessWidget {
  TextEditingController controller;
  IconData data;
  String hintText;
  bool isObsecure = true;

  CustomeTextField(
      {this.controller, this.data, this.hintText, this.isObsecure});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            data,
            color: Colors.orange,
          ),
          focusColor: Colors.orange,
          hintText: hintText,
        ),
      ),
    );
  }
}
