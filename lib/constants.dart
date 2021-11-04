import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xffF9A826);
const kPrimaryLightColor = Color(0xFFFFECDF);

const KPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xffF9A826)]);
const kSecondaryColor = Colors.black;
const kTextColor = Colors.black;
const kAnimationDuration = Duration(milliseconds: 200);
final optInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  enabledBorder: utlineInputBorder(),
  focusedBorder: utlineInputBorder(),
  border: utlineInputBorder(),
);
OutlineInputBorder utlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}
