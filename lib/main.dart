import 'package:flutter/material.dart';
import 'package:woynshet_taem/models/cart.dart';
import 'package:woynshet_taem/models/user.dart';
import 'package:woynshet_taem/providers/auth.dart';
import 'package:woynshet_taem/providers/getHistory.dart';
import 'package:woynshet_taem/routes.dart';
import 'package:woynshet_taem/screens/splash/splash.dart';
import 'package:woynshet_taem/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SingleResponse()),
        ChangeNotifierProvider.value(value: AccountType()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Woynshet taste',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
