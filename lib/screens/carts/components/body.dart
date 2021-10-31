import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/carts/components/cart_item_card.dart';
import 'package:woynshet_taem/size_config.dart';

var id = 5;

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFE6E6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartitemCard(
                        itemNumber: 4,
                        img: "assets/images/mitmita.jpg",
                        price: 34,
                        text: "chil is  heglo world is written by me",
                      ),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFE6E6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartitemCard(
                        itemNumber: 4,
                        img: "assets/images/mitmita.jpg",
                        price: 34,
                        text: "chil is  heglo world is written by me",
                      ),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFE6E6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartitemCard(
                        itemNumber: 4,
                        img: "assets/images/mitmita.jpg",
                        price: 34,
                        text: "chil is  heglo world is written by me",
                      ),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFE6E6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartitemCard(
                        itemNumber: 4,
                        img: "assets/images/mitmita.jpg",
                        price: 34,
                        text: "chil is  heglo world is written by me",
                      ),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
