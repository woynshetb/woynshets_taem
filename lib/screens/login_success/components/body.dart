import 'package:flutter/material.dart';

import 'package:woynshet_taem/screens/home/components/newHome.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/welcome.png",
          height: SizeConfig.screenHeight * 0.4,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          "Login Success",
          style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "Overlock"),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Go to home",
            press: () {
              // simple ui for home
              Navigator.pushNamed(context, NewHome.routeName);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => NewHome()));
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
