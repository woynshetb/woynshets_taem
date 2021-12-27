import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:woynshet_taem/screens/splash/components/body.dart';
import 'package:woynshet_taem/size_config.dart';

class SplashScreens extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SplashScreen(
      seconds: 3,
      image: Image.asset("assets/splash.png"),
      navigateAfterSeconds: Body(),
    );
  }
}
