import 'package:flutter/material.dart';

import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/notification/history.dart';
import 'package:woynshet_taem/screens/notification/historyFunction.dart';

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
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
    ],
  );
}
