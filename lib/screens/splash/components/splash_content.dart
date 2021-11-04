import 'package:flutter/material.dart';
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
          "የወይንእሸት ጣዕም",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontFamily: "Kiros"),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: "Chiret"),
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
