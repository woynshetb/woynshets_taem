import 'package:flutter/material.dart';

import 'package:woynshet_taem/constants.dart';

class SearchBox extends StatelessWidget {
  final Function onChanged;
  const SearchBox({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: kSecondaryColor.withOpacity(0.32),
          )),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search Sauce",
          hintStyle: TextStyle(color: kSecondaryColor),
        ),
      ),
    );
  }
}
