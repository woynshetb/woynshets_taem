import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Text(
          "የወይንእሸት ጣእም",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(
          height: 12,
        ),
        Image.asset(
          image,
          height: 350,
          width: 400,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
