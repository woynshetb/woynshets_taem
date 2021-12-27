import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:woynshet_taem/constants.dart';

import 'package:woynshet_taem/screens/splash/components/body.dart';
import 'package:woynshet_taem/size_config.dart';

class SplashScreens extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SplashScreen(
      title: Text(
        "የወይእሸት ጣዕም \nWoynshet's Taste",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.w900, fontFamily: "Kiros"),
      ),
      useLoader: true,
      loaderColor: Colors.orange,
      seconds: 3,
      navigateAfterSeconds: Scaffold(body: Body()),
    );
  }
}
