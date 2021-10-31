import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/details/components/app_bar.dart';
import 'package:woynshet_taem/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/detail_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}
