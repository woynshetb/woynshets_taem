import 'package:flutter/material.dart';

import 'package:woynshet_taem/constants.dart';

import 'package:woynshet_taem/screens/notification/historyFunction.dart';
import 'package:woynshet_taem/screens/notification/orderHistory.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "የወይንእሸት",
            style: TextStyle(color: kSecondaryColor),
          ),
          TextSpan(
            text: "ጣእም",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
  );
}
