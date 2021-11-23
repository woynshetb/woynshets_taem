import 'package:flutter/material.dart';
import 'package:woynshet_taem/models/cart.dart';
import 'package:woynshet_taem/routes.dart';
import 'package:woynshet_taem/screens/splash/splash.dart';
import 'package:woynshet_taem/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
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
