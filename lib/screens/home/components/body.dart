import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/search_box.dart';
import 'package:woynshet_taem/screens/home/components/category_list.dart';
import 'package:woynshet_taem/screens/home/components/discount_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          CategoryList(),
          DiscountCard(),
        ],
      ),
    );
  }
}
