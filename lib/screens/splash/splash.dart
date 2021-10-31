import 'package:flutter/material.dart';

import 'package:woynshet_taem/screens/splash/components/body.dart';
import 'package:woynshet_taem/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
