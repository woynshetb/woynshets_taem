import 'package:flutter/material.dart';
import 'package:woynshet_taem/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);
  final String icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
