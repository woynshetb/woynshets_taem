import 'package:flutter/material.dart';
import 'package:woynshet_taem/screens/home/components/testing.dart';

import 'package:woynshet_taem/screens/splash/components/body.dart';
import 'package:woynshet_taem/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: Color(0xfffff0d9),
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
