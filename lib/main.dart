import 'package:flutter/material.dart';
import 'package:woynshet_taem/routes.dart';
import 'package:woynshet_taem/screens/splash/splash.dart';
import 'package:woynshet_taem/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Woynshet taste',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}