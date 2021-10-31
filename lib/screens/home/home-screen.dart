import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/bottom_nav_bar.dart';
import 'package:woynshet_taem/screens/home/components/app_bar.dart';
import 'package:woynshet_taem/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}
